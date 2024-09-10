import 'package:easy_flutter_boilerplate/app/core/base/screen_state.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '/app/presentation/modules/order/controllers/order_controller.dart';
import '/app/routes/app_router.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ScreenState<OrderScreen, OrderController> {
  @override
  String? get routeName => AppRoutes.order.name;

  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          appRouter.pop();
        },
        child: const Text("Order Screen"),
      ),
    );
  }
}
