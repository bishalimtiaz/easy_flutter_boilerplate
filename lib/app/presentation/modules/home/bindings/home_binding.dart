import 'package:easy_flutter_boilerplate/app/di/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/view_model/home_view_model.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class HomeBinding extends Binding {
  @override
  bool get isSingleInstance => true;

  @override
  Future<void> addDependencies() async {
    DependencyProvider().registerScreenViewModel<HomeViewModel>(
      () => HomeViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().unregisterDependency<HomeViewModel>();
  }
}
