import 'package:flutter/cupertino.dart';
import 'package:easy_flutter_boilerplate/app/core/base/base_controller.dart';

class BottomNavController extends BaseController {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  void setSelectedIndex(int index) {
    if (index == selectedIndex.value) {
      return;
    }
    selectedIndex.value = index;
  }

  @override
  void onDispose() {
    selectedIndex.dispose();
    super.onDispose();
  }
}
