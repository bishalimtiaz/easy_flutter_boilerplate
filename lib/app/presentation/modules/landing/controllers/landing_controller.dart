import 'package:easy_flutter_boilerplate/app/core/base/screen_controller.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/bottom_navbar/bottom_nav_controller.dart';

class LandingController extends ScreenController {
  late final BottomNavController navController;

  @override
  void onInit() {
    navController = BottomNavController();

    super.onInit();
  }

  @override
  void onDispose() {
    navController.onDispose();
    super.onDispose();
  }
}
