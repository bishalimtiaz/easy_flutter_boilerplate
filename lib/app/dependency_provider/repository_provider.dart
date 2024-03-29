import 'package:get_it/get_it.dart';
import 'package:easy_flutter_boilerplate/app/data/repository_impl/home_repository_impl.dart';
import 'package:easy_flutter_boilerplate/app/domain/repository/home_repository.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/provider.dart';

class RepositoryProvider implements Provider {
  @override
  Future<void> provide(GetIt locator) async {
    locator.registerFactory<HomeRepository>(() => HomeRepositoryImpl());
  }
}
