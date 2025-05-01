import 'package:easy_flutter_boilerplate/app/di/dependency_provider/dependency_provider.dart';
import 'package:easy_flutter_boilerplate/app/di/dependency_provider/provider.dart';
import 'package:easy_flutter_boilerplate/app/data/repository_impl/home_repository_impl.dart';
import 'package:easy_flutter_boilerplate/app/domain/repository/home_repository.dart';

class RepositoryProvider implements Provider {
  @override
  Future<void> provide() async {
    DependencyProvider().registerFactoryDependency<HomeRepository>(() => HomeRepositoryImpl());
  }
}
