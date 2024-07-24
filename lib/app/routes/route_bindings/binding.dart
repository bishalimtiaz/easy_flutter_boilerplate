abstract class Binding {
  bool get isSingleInstance => false;

  Future<void> addDependencies();

  Future<void> removeDependencies();
}
