import 'package:easy_flutter_boilerplate/app/core/base/screen_state.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '/app/presentation/modules/profile/controllers/profile_controller.dart';
import '/app/routes/app_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState
    extends ScreenState<ProfileScreen, ProfileController> {
  @override
  String? get routeName => AppRoutes.profile.name;

  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          appRouter.pop();
        },
        child: const Text("Profile Screen"),
      ),
    );
  }

}
