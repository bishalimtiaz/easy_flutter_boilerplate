import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenBuilder<T> extends GoRoute {
  final Widget Function(BuildContext, GoRouterState) screenBuilder;

  ScreenBuilder({
    required super.path,
    required super.name,
    required this.screenBuilder,
    super.parentNavigatorKey,
  }) : super(
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<T>(
              name: name,
              key: state.pageKey,
              child: screenBuilder.call(context, state),
            );
          },
        );
}
