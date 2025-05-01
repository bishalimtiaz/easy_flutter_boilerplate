import 'package:easy_flutter_boilerplate/app/utils/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class BaseViewModel extends Disposable {
  BaseViewModel() {
    onInit();
  }

  @mustCallSuper
  void onInit() {
    Log.print('$runtimeType Initialized');
  }

  @override
  @mustCallSuper
  void onDispose() {
    Log.print('$runtimeType Disposed');
  }
}
