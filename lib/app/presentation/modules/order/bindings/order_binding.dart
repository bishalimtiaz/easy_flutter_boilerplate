import 'package:easy_flutter_boilerplate/app/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/order/controllers/order_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';

class OrderBinding extends Binding {
  // @override
  // bool get isSingleInstance => true;

  @override
  Future<void> addDependencies() async {
    DependencyProvider().registerScreenController<OrderController>(
      () => OrderController(),
    );
  }

  @override
  Future<void> removeDependencies() async {
    DependencyProvider().unregisterDependency<OrderController>();
  }
}
