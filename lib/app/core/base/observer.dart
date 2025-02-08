import 'package:easy_flutter_boilerplate/app/core/base/notifier.dart';
import 'package:flutter/material.dart';

final class Observer<T extends Object?> extends ListenableBuilder {
  final Notifier observable;

  Observer({
    required this.observable,
    required ObservableBuilder<T> builder,
    super.key,
  })  : assert(
          observable.value is T,
          'Observable value type mismatch: expected ${T.toString()}, got ${observable.value.runtimeType}',
        ),
        super(
          listenable: observable,
          builder: (context, child) => builder(context, observable.value as T),
        );
}
