import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';
import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/bottom_navbar/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController controller;

  const BottomNavBar({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer<int>(
      observable: controller.selectedIndex,
      childBuilder: (BuildContext context, int value, _) {
        return NavigationBar(
          selectedIndex: value,
          onDestinationSelected: controller.setSelectedIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Order',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
