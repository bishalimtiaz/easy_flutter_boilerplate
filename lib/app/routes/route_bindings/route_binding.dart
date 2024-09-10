import 'package:easy_flutter_boilerplate/app/presentation/modules/home/bindings/home_binding.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/landing/bindings/landing_binding.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/order/bindings/order_binding.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/bindings/profile_binding.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/splash/bindings/splash_binding.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

typedef Binder = Binding Function();

final Map<String, Binder> routeBindings = <String, Binder>{
  AppRoutes.splash.name: () => SplashBinding(),
  AppRoutes.landing.name: () => LandingBinding(),
  AppRoutes.order.name: () => OrderBinding(),
  AppRoutes.home.name: () => HomeBinding(),
  AppRoutes.profile.name: () => ProfileBinding(),
};
