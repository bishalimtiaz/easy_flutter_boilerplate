import 'package:flutter/material.dart';

typedef ObservableBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  Widget? child,
);

abstract class Notifier extends ChangeNotifier {
  dynamic get value;
}
