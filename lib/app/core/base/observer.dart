import 'package:easy_flutter_boilerplate/app/core/base/notifier.dart';
import 'package:flutter/material.dart';

final class Observer extends ListenableBuilder {
  final Notifier observable;

  Observer({
    required this.observable,
    required ObservableBuilder builder,
    super.key,
  }) : super(
          listenable: observable,
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            // Extract the value from listenable
            return builder(
              context,
            ); // Pass value to builder
          },
        );
}
