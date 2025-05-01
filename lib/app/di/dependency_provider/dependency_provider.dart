import 'package:easy_flutter_boilerplate/app/core/services/app_service.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/route_binding.dart';
import 'package:easy_flutter_boilerplate/app/utils/log.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class DependencyProvider {
  DependencyProvider._internal();

  static final DependencyProvider _instance = DependencyProvider._internal();

  factory DependencyProvider() => _instance;

  Future<void> registerSingletonDependency<T extends Object>(
    T Function() factoryFunc,
  ) async {
    locator.registerLazySingleton(factoryFunc);
  }

  void registerScreenViewModel<T extends Object>(
    T Function() viewModel,
  ) {
    final bool isSingleInstance = isCurrentRouteSingleInstance;
    if (isSingleInstance) {
      try {
        if (!locator.isRegistered<T>()) {
          locator.registerLazySingleton(viewModel);
        }
      } catch (e) {
        Log.error('Error registering Singleton viewModel: $e');
      }
    } else {
      try {
        if (!locator.isRegistered<T>()) {
          locator.registerFactory(viewModel);
        }
      } catch (e) {
        Log.error('Error registering Factory viewModel: $e');
      }
    }
  }

  void unregisterDependency<T extends Object>() {
    try {
      if (locator.isRegistered<T>()) {
        locator.unregister<T>();
      }
    } catch (e) {
      Log.error('Error removing Screen viewModel: $e');
    }
  }

  void registerFactoryDependency<T extends Object>(
    T Function() factoryFunc,
  ) {
    if (!locator.isRegistered<T>()) {
      locator.registerFactory(factoryFunc);
    }
  }

  bool get isCurrentRouteSingleInstance {
    final currentRoute = AppService.currentRouteName;
    final Binding? binding = routeBindings[currentRoute]?.call();
    if (binding != null && !binding.isSingleInstance) {
      return true;
    } else {
      return false;
    }
  }
}
