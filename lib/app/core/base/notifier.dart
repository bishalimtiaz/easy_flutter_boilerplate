import 'package:flutter/material.dart';

typedef ObservableBuilder = Widget Function(
  BuildContext context,
);

abstract class Notifier extends ChangeNotifier {
  dynamic get value;
}
