import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/home/bindings/home_binding.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/landing/controllers/landing_controller.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/order/bindings/order_binding.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/bindings/profile_binding.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class LandingBinding extends Binding {
  @override
  Future<void> addDependencies() async {
    DependencyProvider().registerScreenController<LandingController>(
      () => LandingController(),
    );
    HomeBinding().addDependencies();
    OrderBinding().addDependencies();
    ProfileBinding().addDependencies();
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().unregisterDependency<LandingController>();

    HomeBinding().removeDependencies();
    OrderBinding().removeDependencies();
    ProfileBinding().removeDependencies();
  }
}
