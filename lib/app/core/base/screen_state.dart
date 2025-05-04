import 'package:easy_flutter_boilerplate/app/core/services/app_service.dart';
import 'package:easy_flutter_boilerplate/app/di/dependency_provider/dependency_provider.dart';
import 'package:flutter/foundation.dart';

import '/app/core/base/screen_view_model.dart';
import 'package:flutter/material.dart';
import '/app/core/base/base_state.dart';

abstract class ScreenState<T extends StatefulWidget, C extends ScreenViewModel>
    extends BaseState<T, C> {
  late final String? _currentRouteName;

  @override
  void initState() {
    _currentRouteName = AppService.currentRouteName;
    super.initState();
  }

  @override
  @nonVirtual
  void dispose() {
    if (DependencyProvider().canDispose(_currentRouteName)) {
      viewModel.onDispose();
    }
    super.dispose();
  }
}
