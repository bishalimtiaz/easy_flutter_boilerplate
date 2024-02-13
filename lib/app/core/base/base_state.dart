import 'package:flutter/material.dart';
import '/app/core/base/base_controller.dart';
import '/app/dependency_provider/dependency_provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BaseController>
    extends State<T> {
  late final C controller;

  String? get routeName;

  @override
  void initState() {
    controller = locator.get<C>();

    initializeListener();
    super.initState();
  }

  @override
  void dispose() {
    removeListener();
    if (DependencyProvider().canDispose(routeName)) {
      controller.onDispose();
    }
    super.dispose();
  }

  void initializeListener() {}

  void removeListener() {}
}
