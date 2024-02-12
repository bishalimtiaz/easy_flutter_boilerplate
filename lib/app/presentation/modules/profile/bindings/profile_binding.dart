import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/controllers/profile_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class ProfileBinding extends Binding {
  @override
  Future<void> addDependencies() async {
    DependencyProvider().provideScreenController<ProfileController>(
      () => ProfileController(),
      isSingleInstance: isSingleInstance,
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().removeScreenController<ProfileController>();
  }
}
