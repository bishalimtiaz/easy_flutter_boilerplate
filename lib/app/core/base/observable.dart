import 'package:flutter/material.dart';

class Observable<T> extends ChangeNotifier {
  T _value;

  Observable(this._value);

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
