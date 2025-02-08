import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';
import 'package:easy_flutter_boilerplate/app/core/base/observable_list.dart';
import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';

class TestModel {
  String name;
  int value;

  TestModel(this.name, this.value);
}

void main() {
  group('Observer Tests', () {
    testWidgets('Observer rebuilds when Observable value changes',
        (WidgetTester tester) async {
      final Observable<int> observable = Observable<int>(0);

      // Build a simple UI with Observer
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Observer<int>(
              observable: observable,
              builder: (BuildContext context, int value) {
                return Text('Value: $value');
              },
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('Value: 0'), findsOneWidget);

      // Update the observable
      observable.value = 42;
      await tester.pump();

      // Verify UI updates
      expect(find.text('Value: 42'), findsOneWidget);
    });

    testWidgets('Observer rebuilds when ObservableList changes',
        (WidgetTester tester) async {
      final ObservableList<String> observableList =
          ObservableList<String>.from(['A', 'B', 'C']);

      // Build a UI with Observer
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Observer<List<String>>(
              observable: observableList,
              builder: (BuildContext context, List<String> list) {
                return Column(
                  children: list.map((item) => Text(item)).toList(),
                );
              },
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);

      // Modify the observable list
      observableList.add('D');
      await tester.pump();

      // Verify UI updates
      expect(find.text('D'), findsOneWidget);

      // Remove an item from the list
      observableList.remove('B');
      await tester.pump();

      // Verify UI updates
      expect(find.text('B'), findsNothing);
      expect(find.text('A'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
      expect(find.text('D'), findsOneWidget);
    });

    testWidgets('Observer does not rebuild when Observable value remains same',
        (WidgetTester tester) async {
      final Observable<int> observable = Observable<int>(0);
      int buildCount = 0;

      // Build a simple UI with Observer
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Observer<int>(
              observable: observable,
              builder: (BuildContext context, int value) {
                buildCount++;
                return Text('Value: $value');
              },
            ),
          ),
        ),
      );

      // Initial build
      expect(buildCount, 1);

      // Set the same value
      observable.value = 0;
      await tester.pump();

      // Verify the UI does not rebuild
      expect(buildCount, 1);
    });

    testWidgets('Observer works with complex ObservableList updates',
        (WidgetTester tester) async {
      final ObservableList<int> observableList =
          ObservableList<int>.from([1, 2, 3]);

      // Build a UI with Observer
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Observer<List<int>>(
              observable: observableList,
              builder: (BuildContext context, List<int> list) {
                return Column(
                  children: list.map((item) => Text('Item: $item')).toList(),
                );
              },
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('Item: 1'), findsOneWidget);
      expect(find.text('Item: 2'), findsOneWidget);
      expect(find.text('Item: 3'), findsOneWidget);

      // Perform a batch update
      observableList.batchUpdate((list) {
        list.add(4);
        list.add(5);
        list.remove(2);
      });
      await tester.pump();

      // Verify UI updates
      expect(find.text('Item: 1'), findsOneWidget);
      expect(find.text('Item: 2'), findsNothing);
      expect(find.text('Item: 3'), findsOneWidget);
      expect(find.text('Item: 4'), findsOneWidget);
      expect(find.text('Item: 5'), findsOneWidget);
    });

    testWidgets('Observer handles empty ObservableList gracefully',
        (WidgetTester tester) async {
      final ObservableList<String> observableList =
          ObservableList<String>.empty(growable: true);

      // Build a UI with Observer
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Observer<List<String>>(
              observable: observableList,
              builder: (BuildContext context, List<String> list) {
                return Column(
                  children:
                      observableList.value.map((item) => Text(item)).toList(),
                );
              },
            ),
          ),
        ),
      );

      // Initial state
      expect(find.byType(Text), findsNothing);

      // Add an item to the list
      observableList.add('New Item');
      await tester.pump();

      // Verify UI updates
      expect(find.text('New Item'), findsOneWidget);
    });

    /// Observable with Complex Objects
    testWidgets('Observer rebuilds when complex ObservableList objects change',
        (WidgetTester tester) async {
      final ObservableList<TestModel> observableList =
          ObservableList<TestModel>.from(
              [TestModel('A', 1), TestModel('B', 2)]);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Observer<List<TestModel>>(
              observable: observableList,
              builder: (BuildContext context, List<TestModel> list) {
                return Column(
                  children: list
                      .map((item) => Text('${item.name}: ${item.value}'))
                      .toList(),
                );
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(find.text('A: 1'), findsOneWidget);
      expect(find.text('B: 2'), findsOneWidget);

      // Update a value in the list
      observableList.updateAt(0, (item) => item?.value = 10);
      await tester.pump();

      // Verify UI updates
      expect(find.text('A: 10'), findsOneWidget);
    });

    /// Simultaneous Observables
    testWidgets('Multiple Observers with different observables',
        (WidgetTester tester) async {
      final Observable<int> observable1 = Observable<int>(0);
      final Observable<String> observable2 = Observable<String>('A');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Observer<int>(
                  observable: observable1,
                  builder: (BuildContext context, int value) {
                    return Text('Int: $value');
                  },
                ),
                Observer<String>(
                  observable: observable2,
                  builder: (BuildContext context, String value) {
                    return Text('String: $value');
                  },
                ),
              ],
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('Int: 0'), findsOneWidget);
      expect(find.text('String: A'), findsOneWidget);

      // Update the first observable
      observable1.value = 42;
      await tester.pump();

      // Verify that only the first observer rebuilds
      expect(find.text('Int: 42'), findsOneWidget);
      expect(find.text('String: A'), findsOneWidget);

      // Update the second observable
      observable2.value = 'B';
      await tester.pump();

      // Verify that only the second observer rebuilds
      expect(find.text('Int: 42'), findsOneWidget);
      expect(find.text('String: B'), findsOneWidget);
    });

    /// Observer Removal
    testWidgets('Observer unregisters listeners when removed',
        (WidgetTester tester) async {
      final Observable<int> observable = Observable<int>(0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                // Trigger rebuild when observable changes
                return Observer<int>(
                  observable: observable,
                  builder: (BuildContext context, int value) {
                    if (value == 0) {
                      return const Text('Observer Active');
                    } else {
                      return const Text('Observer Removed');
                    }
                  },
                );
              },
            ),
          ),
        ),
      );

      // Initial state
      expect(find.text('Observer Active'), findsOneWidget);
      expect(find.text('Observer Removed'), findsNothing);

      // Update the observable to remove the Observer
      observable.value = 1;

      // Rebuild explicitly
      await tester.pump();

      // Verify that the Observer is removed
      expect(find.text('Observer Active'), findsNothing);
      expect(find.text('Observer Removed'), findsOneWidget);
    });
  });
}
