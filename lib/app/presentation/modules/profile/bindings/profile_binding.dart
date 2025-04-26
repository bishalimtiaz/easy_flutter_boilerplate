import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/controllers/profile_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class ProfileBinding extends Binding {
  @override
  // TODO: implement isSingleInstance
  bool get isSingleInstance => true;

  @override
  Future<void> addDependencies() async {
    DependencyProvider().registerScreenController<ProfileController>(
      () => ProfileController(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().unregisterDependency<ProfileController>();
  }
}
