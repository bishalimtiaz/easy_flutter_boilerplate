import 'package:get_it/get_it.dart';
import 'package:easy_flutter_boilerplate/app/data/datasource/remote/home/home_data_source.dart';
import 'package:easy_flutter_boilerplate/app/data/datasource/remote/home/home_data_source_impl.dart';
import 'package:easy_flutter_boilerplate/app/dependency_provider/provider.dart';

class DataSourceProvider implements Provider {
  @override
  Future<void> provide(GetIt locator) async {
    locator.registerFactory<HomeDataSource>(() => HomeDataSourceImpl());
  }
}
