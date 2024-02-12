import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_flutter_boilerplate/app/core/base/screen_builder.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/home_screen.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/landing/landing_screen.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/order/order_screen.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/splash/splash_screen.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:easy_flutter_boilerplate/app/routes/go_router_observer.dart';
import 'package:easy_flutter_boilerplate/app/routes/navigation_helper.dart';

abstract class _Path {
  static const String splash = '/splash';
  static const String landing = '/landing';
  static const String order = '/order';
  static const String home = '/home';
}

final GoRouter appRouter = GoRouter(
  navigatorKey: NavigationHelper().parentNavigatorKey,
  initialLocation: _Path.splash,
  observers: <NavigatorObserver>[GoRouterObserver()],
  routes: <RouteBase>[
    ScreenBuilder<SplashScreen>(
      path: _Path.splash,
      name: AppRoutes.splash,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    ScreenBuilder<LandingScreen>(
      path: _Path.landing,
      name: AppRoutes.landing,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const LandingScreen();
      },
    ),
    ScreenBuilder<OrderScreen>(
      path: _Path.order,
      name: AppRoutes.order,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const OrderScreen();
      },
    ),
    ScreenBuilder<HomeScreen>(
      path: _Path.home,
      name: AppRoutes.home,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
