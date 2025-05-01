import 'package:easy_flutter_boilerplate/app/core/base/observer.dart';
import 'package:easy_flutter_boilerplate/app/presentation/shared/widget/bottom_navbar/bottom_nav_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavViewModel viewModel;

  const BottomNavBar({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      observable: viewModel.selectedIndex,
      builder: (BuildContext context, int value) {
        return NavigationBar(
          selectedIndex: value,
          onDestinationSelected: viewModel.setSelectedIndex,
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
