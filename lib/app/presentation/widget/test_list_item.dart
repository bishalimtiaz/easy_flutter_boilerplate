import 'package:easy_flutter_boilerplate/app/presentation/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class TestListItem extends StatelessWidget {
  final SomeModel model;

  const TestListItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    print('item_build_debug: ${model.itemIndex}');
    return Container(
      color: model.isSelected ? Colors.green : Colors.white,
      height: 50,
      child: Center(
        child: Text("index: ${model.itemIndex} Count: ${model.count}"),
      ),
    );
  }
}
