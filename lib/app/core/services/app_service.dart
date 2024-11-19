import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';
import 'package:go_router/go_router.dart';

class AppService {
  AppService._internal();

  static final AppService _instance = AppService._internal();

  factory AppService() => _instance;

  static BuildContext get context =>
      appRouter.routerDelegate.navigatorKey.currentContext!;

  static final GoRouterState? _currentState = appRouter.state;

  static String? get currentRouteName => _currentState?.name;

  Future<void> start() async {
    DependencyProvider().provideDI();
  }
}
