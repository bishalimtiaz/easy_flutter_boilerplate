import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenBuilder<T> extends GoRoute {
  final Widget Function(BuildContext, GoRouterState) screenBuilder;

  ScreenBuilder({
    required super.path,
    required super.name,
    required this.screenBuilder,
    super.parentNavigatorKey,
    super.routes,
    super.onExit,
    super.redirect,
  }) : super(
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              name: name,
              key: state.pageKey,
              child: screenBuilder.call(context, state),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          },
        );
}
