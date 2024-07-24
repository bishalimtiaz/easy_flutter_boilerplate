import 'package:easy_flutter_boilerplate/app/core/utils/log.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class BaseController extends Disposable {
  BaseController() {
    onInit();
  }

  @mustCallSuper
  void onInit() {
    Log.print("$runtimeType Initialized");
  }

  @override
  @mustCallSuper
  void onDispose() {
    Log.print("$runtimeType Disposed");
  }
}
