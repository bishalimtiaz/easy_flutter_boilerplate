import 'package:easy_flutter_boilerplate/app/core/base/observable_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ObservableList Tests', () {
    test('Listeners are notified when an item is added', () {
      final ObservableList<int> list =
      ObservableList<int>.empty(growable: true);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.add(1);
      expect(list.value.contains(1), isTrue);
      expect(notified, isTrue);
    });

    test('Listeners are notified when an item is removed', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.remove(2);
      expect(list.value.contains(2), isFalse);
      expect(notified, isTrue);
    });

    test('Listeners are notified when the list is cleared', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.clear();
      expect(list.value.isEmpty, isTrue);
      expect(notified, isTrue);
    });

    test('Batch update notifies listeners once', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      int notificationCount = 0;

      list.addListener(() {
        notificationCount += 1;
      });

      list.batchUpdate((List<int> lst) {
        lst.add(4);
        lst.add(5);
      });

      expect(notificationCount, 1);
      expect(list.value, containsAll(<int>[1, 2, 3, 4, 5]));
    });

    test('Listeners are notified when multiple items are added', () {
      final ObservableList<int> list = ObservableList<int>.empty(growable: true);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.addAll([1, 2, 3]);
      expect(list.value, containsAll(<int>[1, 2, 3]));
      expect(notified, isTrue);
    });

    test('Listeners are notified when an item is removed by index', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.removeAt(1);
      expect(list.value, containsAll(<int>[1, 3]));
      expect(notified, isTrue);
    });

    test('Listeners are notified when an item is replaced', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.replaceAt(1, 5);
      expect(list.value[1], 5);
      expect(notified, isTrue);
    });

    test('Listeners are notified when an item is updated', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.updateAt(1, (value) => value = 10);
      expect(list.value[1], 2); // No change since updateAt does not replace value
      expect(notified, isTrue);
    });

    test('Listeners are notified when the list is set to a new list', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.value = [4, 5, 6];
      expect(list.value, [4, 5, 6]);
      expect(notified, isTrue);
    });

    test('Listeners are not notified when setting the same list', () {
      final ObservableList<int> list = ObservableList<int>.from(<int>[1, 2, 3]);
      bool notified = false;

      list.addListener(() {
        notified = true;
      });

      list.value = [1, 2, 3]; // Setting the same list
      expect(notified, isFalse);
    });

    test('ObservableList equality operator works correctly', () {
      final ObservableList<int> list1 = ObservableList<int>.from(<int>[1, 2, 3]);
      final ObservableList<int> list2 = ObservableList<int>.from(<int>[1, 2, 3]);
      final ObservableList<int> list3 = ObservableList<int>.from(<int>[4, 5, 6]);

      expect(list1 == list2, isTrue);
      expect(list1 == list3, isFalse);
    });
  });

  test('Throws RangeError when accessing out-of-bound index', () {
    final ObservableList<int> list = ObservableList<int>.from([1, 2, 3]);
    expect(() => list.replaceAt(3, 4), throwsRangeError);
  });

  /// performance test
  test('Handles large list efficiently', () {
    final ObservableList<int> list = ObservableList<int>.empty(growable: true);
    list.addAll(List<int>.generate(10000, (index) => index));
    expect(list.value.length, 10000);
  });

}
