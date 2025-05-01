import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';
import 'package:easy_flutter_boilerplate/app/core/base/base_view_model.dart';

class BottomNavViewModel extends BaseViewModel {
  final Observable<int> selectedIndex = Observable<int>(0);

  void setSelectedIndex(int index) {
    if (index == selectedIndex.value) {
      return;
    }
    selectedIndex.value = index;
  }

  @override
  void onDispose() {
    selectedIndex.dispose();
    super.onDispose();
  }
}
