import 'package:easy_flutter_boilerplate/app/di/dependency_provider/dependency_provider.dart';
import 'package:flutter/material.dart';
import '/app/core/base/base_view_model.dart';
abstract class BaseState<T extends StatefulWidget, C extends BaseViewModel>
    extends State<T> {
  late final C viewModel;


  @override
  void initState() {
    viewModel = locator.get<C>();

    initializeListener();
    super.initState();
  }

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }

  void initializeListener() {}

  void removeListener() {}
}
