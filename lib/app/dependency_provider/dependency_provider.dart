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

  Future<void> removeSharedController<T extends Object>(
    T Function() controller,
  ) async {
    locator.unregister<T>();
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

  void removeScreenController<T extends Object>() {
    if (locator.isRegistered<T>()) {
      locator.unregister<T>();
    }
  }

  void provideControllerDependency<T extends Object>(
    T Function() controller,
  ) {
    if (!locator.isRegistered<T>()) {
      locator.registerFactory(controller);
    }
  }
}
