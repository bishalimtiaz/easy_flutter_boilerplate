import 'package:flutter/material.dart';
import '/app/core/base/base_controller.dart';
import '/app/dependency_provider/dependency_provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BaseController>
    extends State<T> {
  late final C controller;


  @override
  void initState() {
    controller = locator.get<C>();

    initializeListener();
    super.initState();
  }

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }

  void initializeListener() {}

  void removeListener() {}
}
