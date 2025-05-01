import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';

import '/app/core/base/base_view_model.dart';

class ScreenViewModel extends BaseViewModel {
  final Observable<int> selectedIndex = Observable<int>(0);
}
