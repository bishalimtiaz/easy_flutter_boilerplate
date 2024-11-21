import 'package:easy_flutter_boilerplate/app/core/services/app_service.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:flutter/foundation.dart';

import '/app/core/base/screen_controller.dart';
import 'package:flutter/material.dart';
import '/app/core/base/base_state.dart';

abstract class ScreenState<T extends StatefulWidget, C extends ScreenController>
    extends BaseState<T, C> {
  late final String? _routeName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _routeName = AppService.currentRouteName;
    });
  }

  @override
  @nonVirtual
  void dispose() {
    super.dispose();
    if (DependencyProvider().canDispose(_routeName)) {
      controller.onDispose();
    }
  }
}
