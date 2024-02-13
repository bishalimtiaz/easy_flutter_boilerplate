import 'package:easy_flutter_boilerplate/app/core/base/screen_controller.dart';
import 'package:easy_flutter_boilerplate/app/core/utils/log.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/bottom_navbar/bottom_nav_controller.dart';

class LandingController extends ScreenController {
  late final BottomNavController navController;

  @override
  void onInit() {
    Log.debug("onInit LandingController");
    navController = BottomNavController();

    super.onInit();
  }

  @override
  void onDispose() {
    Log.debug("onDispose LandingController");
    navController.onDispose();
    super.onDispose();
  }
}
