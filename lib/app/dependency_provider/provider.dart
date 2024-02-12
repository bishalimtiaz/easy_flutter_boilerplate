import 'package:get_it/get_it.dart';

abstract class Provider {
  Future<void> provide(GetIt locator);
}
