import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/controllers/home_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class HomeBinding extends Binding {
  @override
  Future<void> addDependencies() async {
    DependencyProvider().provideScreenController<HomeController>(
      () => HomeController(),
      isSingleInstance: isSingleInstance,
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().removeController<HomeController>();
  }
}
