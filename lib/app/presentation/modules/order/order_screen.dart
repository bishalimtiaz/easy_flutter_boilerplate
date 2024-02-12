import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/core/base/app_state.dart';
import 'package:easy_flutter_boilerplate/app/presentation/modules/order/controllers/order_controller.dart';
import 'package:easy_flutter_boilerplate/app/routes/app_router.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends AppState<OrderScreen, OrderController> {
  @override
  Widget buildScreen(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          appRouter.pop();
        },
        child: Text("Order Screen"),
      ),
    );
  }
}
