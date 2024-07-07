import 'dart:ui';

import 'package:easy_flutter_boilerplate/app/presentation/widget/animated_hello/animated_hello_util.dart';
import 'package:flutter/material.dart';

class AnimatedHelloPainter extends CustomPainter {
  final double progress;
  final AnimatedHelloUtil util;

  AnimatedHelloPainter({
    required this.progress,
    required this.util,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the scaling factor

    final progressLength = util.totalPathLength * progress;

    // Draw each path segment based on the progress
    double currentLength = 0.0;
    for (int i = 0; i < util.paths.length; i++) {
      final path = util.paths[i];
      final pathMetrics = path.computeMetrics().toList();
      final pathLength =
          pathMetrics.fold(0.0, (sum, metric) => sum + metric.length);

      if (currentLength + pathLength > progressLength) {
        final remainingLength = progressLength - currentLength;
        final extractedPath = _extractPartialPath(pathMetrics, remainingLength);
        util.paint.shader = util.shaders[i];
        canvas.drawPath(extractedPath, util.paint);
        break;
      } else {
        util.paint.shader = util.shaders[i];
        canvas.drawPath(path, util.paint);
        currentLength += pathLength;
      }
    }
  }


  Path _extractPartialPath(List<PathMetric> pathMetrics, double length) {
    final extractedPath = Path();
    double currentLength = 0.0;

    for (final metric in pathMetrics) {
      if (currentLength + metric.length > length) {
        final remainingLength = length - currentLength;
        extractedPath.addPath(
            metric.extractPath(0.0, remainingLength), Offset.zero);
        break;
      } else {
        extractedPath.addPath(
            metric.extractPath(0.0, metric.length), Offset.zero);
        currentLength += metric.length;
      }
    }

    return extractedPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
