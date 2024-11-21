import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';

class AppService {
  AppService._internal();

  static final AppService _instance = AppService._internal();

  factory AppService() => _instance;

  static BuildContext get context =>
      appRouter.routerDelegate.navigatorKey.currentContext!;

  // static final GoRouterState? _currentState = appRouter.state;
  //TODO: Implement Other Routing Helper Getter

  static String? get currentRouteName =>
      appRouter.routerDelegate.currentConfiguration.last.route.name;
  Future<void> start() async {
    DependencyProvider().provideDI();
  }
}
