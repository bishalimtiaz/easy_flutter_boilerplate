import 'package:easy_flutter_boilerplate/app/core/base/screen_state.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '/app/presentation/modules/home/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ScreenState<HomeScreen, HomeController> {
  @override
  String? get routeName => AppRoutes.home.name;

  @override
  Widget buildScreen(BuildContext context) {
    return const Center(
      child: Text("Home"),
    );
  }
}
