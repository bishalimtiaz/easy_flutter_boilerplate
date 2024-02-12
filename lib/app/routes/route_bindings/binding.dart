abstract class Binding {
  bool get isSingleInstance => true;

  Future<void> addDependencies();

  Future<void> removeDependencies();
}
