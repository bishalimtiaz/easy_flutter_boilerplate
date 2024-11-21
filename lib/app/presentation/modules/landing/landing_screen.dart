import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '/app/core/base/screen_state.dart';
import '/app/presentation/modules/home/home_screen.dart';
import '/app/presentation/modules/landing/controllers/landing_controller.dart';
import '/app/presentation/modules/order/order_screen.dart';
import '/app/presentation/modules/profile/profile_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    super.key,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ScreenState<LandingScreen, LandingController> {
  @override
  @override
  Widget build(BuildContext context) {
    return Observer(
      observable: controller.navController.selectedIndex,
      builder: (BuildContext context) {
        return _getBottomNavbarScreen(
            controller.navController.selectedIndex.value);
      },
    );
  }

  Widget _getBottomNavbarScreen(int index) {
    return index == 0
        ? const HomeScreen()
        : index == 1
            ? const OrderScreen()
            : const ProfileScreen();
  }
}
