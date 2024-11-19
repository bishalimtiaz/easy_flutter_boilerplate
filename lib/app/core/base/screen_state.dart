import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:flutter/foundation.dart';

import '/app/core/base/screen_controller.dart';
import 'package:flutter/material.dart';
import '/app/core/base/base_state.dart';

abstract class ScreenState<T extends StatefulWidget, C extends ScreenController>
    extends BaseState<T, C> {
  String? get routeName;

  @override
  @nonVirtual
  void dispose() {
    super.dispose();
    if (DependencyProvider().canDispose(routeName)) {
      controller.onDispose();
    }
  }
}
