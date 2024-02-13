import 'package:easy_flutter_boilerplate/app/core/services/app_service.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '/app/core/base/screen_state.dart';
import '/app/presentation/modules/home/home_screen.dart';
import '/app/presentation/modules/landing/controllers/landing_controller.dart';
import '/app/presentation/modules/order/order_screen.dart';
import '/app/presentation/modules/profile/profile_screen.dart';
import '/app/presentation/widget/bottom_navbar/bottom_navbar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    super.key,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState
    extends ScreenState<LandingScreen, LandingController> {
  @override
  String? get routeName => AppRoutes.landing;

  @override
  Widget? get bottomNavigationBar => BottomNavBar(
        controller: controller.navController,
      );

  @override
  @override
  Widget buildScreen(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: controller.navController.selectedIndex,
        builder: (BuildContext context, int index, _) {
          return _getBottomNavbarScreen(index);
        });
  }

  Widget _getBottomNavbarScreen(int index) {
    return index == 0
        ? const HomeScreen()
        : index == 1
            ? const OrderScreen()
            : const ProfileScreen();
  }
}
