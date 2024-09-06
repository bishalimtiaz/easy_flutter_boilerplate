import 'package:easy_flutter_boilerplate/app/presentation/widget/animated_hello/animated_hello_painter.dart';
import 'package:easy_flutter_boilerplate/app/presentation/widget/animated_hello/animated_hello_util.dart';
import 'package:flutter/material.dart';

class AnimatedHello extends StatefulWidget {
  final VoidCallback? onAnimationCompleted;

  const AnimatedHello({
    this.onAnimationCompleted,
    super.key,
  });

  @override
  State<AnimatedHello> createState() => _AnimatedHelloState();
}

class _AnimatedHelloState extends State<AnimatedHello>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimatedHelloUtil util;

  @override
  void initState() {
    super.initState();
    util = AnimatedHelloUtil(const Size(400, 300));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _animationController.addStatusListener(_animationStatusListener);
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_animationStatusListener);
    _animationController.dispose();
    super.dispose();
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onAnimationCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(400, 300),
          painter: AnimatedHelloPainter(
            progress: _animationController.value,
            util: util,
          ),
        );
      },
    );
  }
}
