import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/landing/view_model/landing_view_model.dart';
import 'package:flutter/material.dart';
import '/app/core/base/screen_state.dart';
import '/app/presentation/modules/home/home_screen.dart';
import '/app/presentation/modules/order/order_screen.dart';
import '/app/presentation/modules/profile/profile_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({
    super.key,
  });

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState
    extends ScreenState<LandingScreen, LandingViewModel> {
  @override
  @override
  Widget build(BuildContext context) {
    return Observer<int>(
      observable: viewModel.navViewModel.selectedIndex,
      builder: (BuildContext context, int value) {
        return _getBottomNavbarScreen(
            viewModel.navViewModel.selectedIndex.value,);
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
