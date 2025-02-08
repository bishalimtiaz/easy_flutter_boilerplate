import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  group('Observable Tests', () {
    test('Listeners are notified when value changes', () {
      final Observable<int> observable = Observable<int>(0);
      bool notified = false;

      observable.addListener(() {
        notified = true;
      });

      observable.value = 1;
      expect(notified, true);
    });

    test('New value is correctly propagated to listeners', () {
      final Observable<int> observable = Observable<int>(0);
      int? newValue;

      observable.addListener(() {
        newValue = observable.value;
      });

      observable.value = 42;
      expect(newValue, 42);
    });
  });

  test('Handles null value assignment gracefully', () {
    final Observable<int?> observable = Observable<int?>(0);
    observable.value = null;
    expect(observable.value, null);
  });

}
