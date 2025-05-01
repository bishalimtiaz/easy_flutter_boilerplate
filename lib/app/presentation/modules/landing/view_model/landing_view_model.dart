import 'package:easy_flutter_boilerplate/app/core/base/screen_view_model.dart';
import 'package:easy_flutter_boilerplate/app/presentation/shared/widget/bottom_navbar/bottom_nav_view_model.dart';

class LandingViewModel extends ScreenViewModel {
  late final BottomNavViewModel navViewModel;

  @override
  void onInit() {
    navViewModel = BottomNavViewModel();

    super.onInit();
  }

  @override
  void onDispose() {
    navViewModel.onDispose();
    super.onDispose();
  }
}
