import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/splash/view_model/splash_view_model.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class SplashBinding extends Binding {
  @override
  Future<void> addDependencies() async {
    DependencyProvider().registerScreenViewModel<SplashViewModel>(
      () => SplashViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().unregisterDependency<SplashViewModel>();
  }
}
