import 'package:easy_flutter_boilerplate/app/core/base/notifier.dart';
import 'package:flutter/material.dart';

final class Observer<T extends Object?> extends ListenableBuilder {
  final ObservableBuilder<T> childBuilder;
  final Notifier observable;

  Observer({
    required this.observable,
    required this.childBuilder,
    super.key,
  }) : super(
          listenable: observable,
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            // Extract the value from listenable
            return childBuilder(
              context,
              observable.value,
              child,
            ); // Pass value to builder
          },
        );
}
