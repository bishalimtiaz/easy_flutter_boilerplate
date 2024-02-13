import 'package:flutter/material.dart';
import '/app/core/base/observable.dart';

typedef ObservableBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  Widget? child,
);

class Observer<T> extends ListenableBuilder {
  final ObservableBuilder<T> childBuilder;
  final Observable<T> observable;

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
