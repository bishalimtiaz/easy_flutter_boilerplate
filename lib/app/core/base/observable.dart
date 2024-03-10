import 'package:easy_flutter_boilerplate/app/core/base/notifier.dart';

interface class Observable<T extends Object?> extends Notifier {
  T _value;

  Observable(this._value);

  @override
  T get value => _value;

  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      notifyListeners();
    }
  }

  void updateValue(void Function(T) updateFn) {
    updateFn(_value);
    notifyListeners();
  }
}
