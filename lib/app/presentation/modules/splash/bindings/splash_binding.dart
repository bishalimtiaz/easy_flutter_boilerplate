import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/splash/controllers/splash_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class SplashBinding extends Binding {
  @override
  Future<void> addDependencies() async {
    DependencyProvider().provideScreenController<SplashController>(
      () => SplashController(),
      isSingleInstance: isSingleInstance,
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().removeScreenController<SplashController>();
  }
}
