import 'package:easy_flutter_boilerplate/app/di/dependency_provider/provider.dart';
import 'package:easy_flutter_boilerplate/app/data/datasource/remote/home/home_data_source.dart';
import 'package:easy_flutter_boilerplate/app/data/datasource/remote/home/home_data_source_impl.dart';

import 'dependency_provider/dependency_provider.dart';

class DataSourceProvider implements Provider {
  @override
  Future<void> provide() async {
    DependencyProvider().registerFactoryDependency<HomeDataSource>(
      () => HomeDataSourceImpl(),
    );
  }
}
