import 'package:get_it/get_it.dart';

class BaseController extends Disposable {
  BaseController() {
    onInit();
  }

  void onInit() {}

  @override
  void onDispose() {}
}
