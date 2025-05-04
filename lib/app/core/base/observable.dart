import 'package:easy_flutter_boilerplate/app/core/base/notifier.dart';

interface class Observable<T extends Object?> extends Notifier<T> {
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

  void updateObj(void Function(T) updateFn) {
    updateFn(_value);
    notifyListeners();
  }

  void forceUpdate(T newValue) {
    _value = newValue;
    notifyListeners();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Observable<T> &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
