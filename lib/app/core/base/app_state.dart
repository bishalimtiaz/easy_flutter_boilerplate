import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/base/screen_controller.dart';
import 'package:easy_flutter_boilerplate/app/core/services/app_service.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/route_binding.dart';

abstract class AppState<T extends StatefulWidget, C extends ScreenController>
    extends State<T> {
  late final C controller;

  late final String? _currentRouteName;

  Widget buildScreen(BuildContext context);

  Color? get backgroundColor => null;

  Widget? bottomNavigationBar;

  PreferredSizeWidget? appbar;

  @override
  void initState() {
    controller = locator.get<C>();
    _currentRouteName = AppService.currentRouteName;

    initializeListener();
    super.initState();
  }

  @override
  void dispose() {
    removeListener();
    Binding? binding = routeBindings[_currentRouteName]?.call();
    if (binding != null && !binding.isSingleInstance) {
      controller.onDispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: buildScreen(context),
      ),
    );
  }

  void initializeListener() {}

  void removeListener() {}
}
