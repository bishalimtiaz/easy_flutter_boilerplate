import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/base/app_state.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/controllers/home_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AppState<HomeScreen, HomeController> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          appRouter.pop();
        },
        child: Text("Home"),
      ),
    );
  }
}
