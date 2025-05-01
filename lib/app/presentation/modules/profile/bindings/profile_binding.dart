import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/profile/view_model/profile_view_model.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class ProfileBinding extends Binding {
  @override
  bool get isSingleInstance => true;

  @override
  Future<void> addDependencies() async {
    DependencyProvider().registerScreenViewModel<ProfileViewModel>(
      () => ProfileViewModel(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().unregisterDependency<ProfileViewModel>();
  }
}
