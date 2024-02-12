import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/base/app_state.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/controllers/profile_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends AppState<ProfileScreen, ProfileController> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          appRouter.pop();
        },
        child: Text("Profile Screen"),
      ),
    );
  }
}
