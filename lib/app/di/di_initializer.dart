import 'package:easy_flutter_boilerplate/app/di/data_source_provider.dart';
import 'package:easy_flutter_boilerplate/app/di/repository_provider.dart' show RepositoryProvider;
import 'package:easy_flutter_boilerplate/app/di/service_provider.dart' show ServiceProvider;

class DiInitializer{

  Future<void> provideDI() async {
    await DataSourceProvider().provide();
    await RepositoryProvider().provide();
    await ServiceProvider().provide();
  }

}