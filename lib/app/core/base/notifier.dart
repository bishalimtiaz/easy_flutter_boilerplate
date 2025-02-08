import 'package:flutter/material.dart';

typedef ObservableBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

abstract class Notifier<T extends Object?> extends ChangeNotifier {
  T get value;
}
