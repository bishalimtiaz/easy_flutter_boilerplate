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


final GoRouter appRouter = GoRouter(
  navigatorKey: NavigationHelper().parentNavigatorKey,
  initialLocation: AppRoutes.splash.path,
  observers: <NavigatorObserver>[GoRouterObserver()],
  routes: <RouteBase>[
    ScreenBuilder<SplashScreen>(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    ScreenBuilder<LandingScreen>(
      path: AppRoutes.landing.path,
      name: AppRoutes.landing.name,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const LandingScreen();
      },
    ),
    ScreenBuilder<OrderScreen>(
      path: AppRoutes.order.path,
      name: AppRoutes.order.name,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const OrderScreen();
      },
    ),
    ScreenBuilder<HomeScreen>(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      screenBuilder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
