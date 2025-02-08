import 'package:easy_flutter_boilerplate/app/core/base/observable.dart';

import '/app/core/base/base_controller.dart';

class ScreenController extends BaseController {
  final Observable<int> selectedIndex = Observable<int>(0);
}
