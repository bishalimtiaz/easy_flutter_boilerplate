import 'package:flutter/material.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/base_state.dart';

abstract class BottomSheetState<T extends StatefulWidget,
    C extends BaseController> extends BaseState<T, C> {
  Widget buildBottomSheet(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildBottomSheet(context),
    );
  }
}
