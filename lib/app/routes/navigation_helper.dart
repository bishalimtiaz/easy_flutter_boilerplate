import 'package:flutter/material.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/route_binding.dart';

class NavigationHelper {
  NavigationHelper._internal();

  static final NavigationHelper _instance = NavigationHelper._internal();

  factory NavigationHelper() => _instance;

  final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  final Map<String, int> _routeInstanceCounts = <String, int>{};

  int _instanceCount(String routeName) {
    return _routeInstanceCounts[routeName] ?? 0;
  }

  void _addInstanceCount(String routeName) {
    _routeInstanceCounts[routeName] =
        (_routeInstanceCounts[routeName] ?? 0) + 1;
  }

  void _removeInstanceCount(String routeName) {
    if (_routeInstanceCounts.containsKey(routeName)) {
      _routeInstanceCounts[routeName] =
          (_routeInstanceCounts[routeName] ?? 1) - 1;
      if (_routeInstanceCounts[routeName] == 0) {
        _routeInstanceCounts.remove(routeName);
      }
    }
  }

  bool _shouldRemoveInstance(String routeName, Binding binding) {
    return _instanceCount(routeName) == 1;
  }

  void handlePush(String? routeName) {
    if (routeName == null) {
      return;
    }

    final Binding? binding = routeBindings[routeName]?.call();
    binding?.addDependencies();
    _addInstanceCount(routeName);
  }

  void handlePop(String? routeName) {
    if (routeName == null) {
      return;
    }

    final Binding? binding = routeBindings[routeName]?.call();
    if (binding != null && _shouldRemoveInstance(routeName, binding)) {
      binding.removeDependencies();
    }
    _removeInstanceCount(routeName);
  }
}
