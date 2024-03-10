import 'package:easy_flutter_boilerplate/app/routes/route_bindings/binding.dart';
import 'package:easy_flutter_boilerplate/app/routes/route_bindings/route_binding.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_flutter_boilerplate/app/core/utils/log.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/data_source_provider.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/repository_provider.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/service_provider.dart';

GetIt locator = GetIt.instance;

class DependencyProvider {
  DependencyProvider._internal();

  static final DependencyProvider _instance = DependencyProvider._internal();

  factory DependencyProvider() => _instance;

  Future<void> provideDI() async {
    DataSourceProvider().provide(locator);
    RepositoryProvider().provide(locator);
    ServiceProvider().provide(locator);
  }

  Future<void> provideSharedController<T extends Object>(
    T Function() controller,
  ) async {
    locator.registerLazySingleton(controller);
  }

  void provideScreenController<T extends Object>(
    T Function() controller, {
    required bool isSingleInstance,
  }) {
    if (isSingleInstance) {
      try {
        if (!locator.isRegistered<T>()) {
          locator.registerLazySingleton(controller);
        }
      } catch (e) {
        Log.error("Error registering Singleton Controller: $e");
      }
    } else {
      try {
        if (!locator.isRegistered<T>()) {
          locator.registerFactory(controller);
        }
      } catch (e) {
        Log.error("Error registering Factory Controller: $e");
      }
    }
  }

  void removeController<T extends Object>() {
    try {
      if (locator.isRegistered<T>()) {
        locator.unregister<T>();
      }
    } catch (e) {
      Log.error("Error removing Screen Controller: $e");
    }
  }

  void provideControllerDependency<T extends Object>(
    T Function() controller,
  ) {
    if (!locator.isRegistered<T>()) {
      locator.registerFactory(controller);
    }
  }

  bool canDispose(String? routeName) {
    Binding? binding = routeBindings[routeName]?.call();
    if (binding != null && !binding.isSingleInstance) {
      return true;
    } else {
      return false;
    }
  }
}
