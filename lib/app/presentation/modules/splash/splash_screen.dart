import 'package:easy_flutter_boilerplate/app/core/base/screen_state.dart';
import 'package:flutter/material.dart';
import '/app/presentation/modules/splash/controllers/splash_controller.dart';
import '/app/routes/app_router.dart';
import '/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ScreenState<SplashScreen, SplashController> {
  @override
  String? get routeName => AppRoutes.splash;

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
