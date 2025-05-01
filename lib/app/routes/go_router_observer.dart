import 'package:easy_flutter_boilerplate/app/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/routes/navigation_helper.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.print('Pushing Route: ${route.settings.name}');
    NavigationHelper().handlePush(route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    Log.print('Popping Route: ${route.settings.name}');
    NavigationHelper().handlePop(route.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    Log.print('Removing Route: ${route.settings.name}');
    NavigationHelper().handlePop(route.settings.name);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    Log.print('Replaced Route: ${oldRoute?.settings.name} '
        'By Route: ${newRoute?.settings.name}');
  }
}
