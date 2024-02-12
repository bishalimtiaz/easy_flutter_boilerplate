import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/base/app_state.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/splash/controllers/splash_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends AppState<SplashScreen, SplashController> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          appRouter.pushNamed(AppRoutes.landing);
        },
        child: Text("SplashScreen"),
      ),
    );
  }
}
