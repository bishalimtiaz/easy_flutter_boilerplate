import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/base/app_state.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/home_screen.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/landing/controllers/landing_controller.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/order/order_screen.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/profile_screen.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/bottom_navbar/bottom_navbar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    // required this.child,
    super.key,
  });

  // final StatefulNavigationShell child;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends AppState<LandingScreen, LandingController> {
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
