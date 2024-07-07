import 'package:flutter/material.dart';

class AnimatedHelloUtil {
  final Size size;
  late final List<Shader> _shaders;
  late final List<Path> _paths;

  late final double _scaleX;

  late final double _scaleY;
  final Path _combinedPath = Path();
  late final double _totalPathLength;

  final Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  AnimatedHelloUtil(this.size) {
    _initialize();
  }

  void _initialize() async {
    _scaleX = size.width / 1600;
    _scaleY = size.height / 800;
    _initializeShaders();
    _initializePaths();
  }

  List<Shader> get shaders => _shaders;

  List<Path> get paths => _paths;

  Path get combinedPath => _combinedPath;

  double get totalPathLength => _totalPathLength;

  void _initializeShaders() async {
    _shaders = [
      const LinearGradient(
        colors: [Color(0xFF58AA86), Color(0xFFACD15E), Color(0xFF23929E)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFF58AA86), Color(0xFFACD15E), Color(0xFFD7DA0D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFD6D90D), Color(0xFFFAD500), Color(0xFFFDD35D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFFFCB66), Color(0xFFFFD570)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFFF9932), Color(0xFFFFD570)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFF9754E), Color(0xFFFF9F38)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFFA754E), Color(0xFFF65544), Color(0xFFF35F53)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFBF7393), Color(0xFFF35F53)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFFBF7393), Color(0xFF816CB0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFF816CB0), Color(0xFF625EAA)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFF6163B8), Color(0xFF6784D0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
      const LinearGradient(
        colors: [Color(0xFF6784D0), Color(0xFF51A5D3), Color(0xFF7FB6DD)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    ];
  }

  void _initializePaths() async {
    _paths = [
      Path()
        ..moveTo(210 * _scaleX, 558 * _scaleY)
        ..cubicTo(315.361 * _scaleX, 496.256 * _scaleY, 435.76 * _scaleX,
            403.382 * _scaleY, 450.5 * _scaleX, 271.779 * _scaleY),
      Path()
        ..moveTo(450.5 * _scaleX, 271.779 * _scaleY)
        ..cubicTo(457.5 * _scaleX, 209.279 * _scaleY, 394.457 * _scaleX,
            198.607 * _scaleY, 374 * _scaleX, 253.779 * _scaleY)
        ..cubicTo(357.5 * _scaleX, 298.279 * _scaleY, 345.569 * _scaleX,
            437.419 * _scaleY, 336.069 * _scaleX, 504.252 * _scaleY)
        ..cubicTo(326.569 * _scaleX, 571.085 * _scaleY, 324.5 * _scaleX,
            580.279 * _scaleY, 324.5 * _scaleX, 580.279 * _scaleY),
      Path()
        ..moveTo(324.5 * _scaleX, 580.279 * _scaleY)
        ..cubicTo(330.333 * _scaleX, 541.446 * _scaleY, 346.5 * _scaleX,
            463.279 * _scaleY, 373.5 * _scaleX, 431.279 * _scaleY)
        ..cubicTo(403.171 * _scaleX, 396.113 * _scaleY, 460.979 * _scaleX,
            387.506 * _scaleY, 468 * _scaleX, 445.779 * _scaleY)
        ..cubicTo(473 * _scaleX, 487.279 * _scaleY, 445 * _scaleX,
            549.279 * _scaleY, 472.5 * _scaleX, 570.279 * _scaleY)
        ..cubicTo(500 * _scaleX, 591.279 * _scaleY, 569 * _scaleX,
            573.279 * _scaleY, 598 * _scaleX, 553.779 * _scaleY)
        ..cubicTo(607.673 * _scaleX, 547.931 * _scaleY, 616.867 * _scaleX,
            541.934 * _scaleY, 616.867 * _scaleX, 541.934 * _scaleY),
      Path()
        ..moveTo(616.843 * _scaleX, 541.951 * _scaleY)
        ..cubicTo(642.954 * _scaleX, 526.279 * _scaleY, 672.628 * _scaleX,
            499.236 * _scaleY, 683.5 * _scaleX, 461 * _scaleY)
        ..cubicTo(694.242 * _scaleX, 423.223 * _scaleY, 671.241 * _scaleX,
            399.187 * _scaleY, 643.5 * _scaleX, 398.322 * _scaleY),
      Path()
        ..moveTo(643.5 * _scaleX, 398.322 * _scaleY)
        ..cubicTo(628.146 * _scaleX, 397.844 * _scaleY, 611.34 * _scaleX,
            404.463 * _scaleY, 598 * _scaleX, 419.779 * _scaleY)
        ..cubicTo(572.302 * _scaleX, 449.283 * _scaleY, 565.304 * _scaleX,
            507.543 * _scaleY, 593.5 * _scaleX, 540.874 * _scaleY)
        ..cubicTo(607.342 * _scaleX, 559.625 * _scaleY, 639.891 * _scaleX,
            577.227 * _scaleY, 679 * _scaleX, 577.119 * _scaleY),
      Path()
        ..moveTo(679 * _scaleX, 577.119 * _scaleY)
        ..cubicTo(713.35 * _scaleX, 577.024 * _scaleY, 752.76 * _scaleX,
            563.194 * _scaleY, 789 * _scaleX, 524.279 * _scaleY)
        ..cubicTo(797.547 * _scaleX, 515.3 * _scaleY, 803 * _scaleX,
            509.281 * _scaleY, 803 * _scaleX, 509.281 * _scaleY)
        ..cubicTo(825.333 * _scaleX, 481.115 * _scaleY, 871 * _scaleX,
            424 * _scaleY, 889.5 * _scaleX, 358.779 * _scaleY)
        ..cubicTo(904.471 * _scaleX, 306 * _scaleY, 913.5 * _scaleX,
            236.779 * _scaleY, 886.5 * _scaleX, 223.779 * _scaleY)
        ..cubicTo(882.439 * _scaleX, 221.824 * _scaleY, 878.249 * _scaleX,
            220.869 * _scaleY, 874 * _scaleX, 220.885 * _scaleY),
      Path()
        ..moveTo(874 * _scaleX, 220.885 * _scaleY)
        ..cubicTo(846.858 * _scaleX, 220.985 * _scaleY, 817.266 * _scaleX,
            260.668 * _scaleY, 803 * _scaleX, 332 * _scaleY)
        ..cubicTo(791.377 * _scaleX, 390.116 * _scaleY, 789 * _scaleX,
            420.779 * _scaleY, 789 * _scaleX, 464.779 * _scaleY)
        ..cubicTo(788.167 * _scaleX, 501.779 * _scaleY, 799 * _scaleX,
            580.179 * _scaleY, 863 * _scaleX, 581.779 * _scaleY),
      Path()
        ..moveTo(863 * _scaleX, 581.779 * _scaleY)
        ..cubicTo(937.5 * _scaleX, 583.642 * _scaleY, 991.132 * _scaleX,
            513.5 * _scaleY, 1014.5 * _scaleX, 477.279 * _scaleY)
        ..cubicTo(1034.5 * _scaleX, 446.279 * _scaleY, 1068.66 * _scaleX,
            377.951 * _scaleY, 1083 * _scaleX, 320.779 * _scaleY)
        ..cubicTo(1099.5 * _scaleX, 255 * _scaleY, 1090.71 * _scaleX,
            232.07 * _scaleY, 1068 * _scaleX, 224.279 * _scaleY),
      Path()
        ..moveTo(1068 * _scaleX, 224.279 * _scaleY)
        ..cubicTo(1039.5 * _scaleX, 214.5 * _scaleY, 1007.5 * _scaleX,
            253.279 * _scaleY, 992 * _scaleX, 320.779 * _scaleY)
        ..cubicTo(977.852 * _scaleX, 382.394 * _scaleY, 963 * _scaleX,
            463.779 * _scaleY, 981 * _scaleX, 515.779 * _scaleY)
        ..cubicTo(987.5 * _scaleX, 537.686 * _scaleY, 1014.5 * _scaleX,
            581.5 * _scaleY, 1054.5 * _scaleX, 581.5 * _scaleY),
      Path()
        ..moveTo(1054.5 * _scaleX, 581.5 * _scaleY)
        ..cubicTo(1106.16 * _scaleX, 581.833 * _scaleY, 1148.46 * _scaleX,
            536.5 * _scaleY, 1169.46 * _scaleX, 461.5 * _scaleY)
        ..cubicTo(1175.46 * _scaleX, 440.5 * _scaleY, 1198.06 * _scaleX,
            398.5 * _scaleY, 1240.46 * _scaleX, 398.5 * _scaleY),
      Path()
        ..moveTo(1243.96 * _scaleX, 398.5 * _scaleY) // Reverse starting point
        ..cubicTo(1303.56 * _scaleX, 398.5 * _scaleY, 1313.79 * _scaleX,
            455 * _scaleY, 1310.96 * _scaleX, 484.5 * _scaleY)
        ..cubicTo(1310.29 * _scaleX, 515.333 * _scaleY, 1293.26 * _scaleX,
            577.7 * _scaleY, 1230.46 * _scaleX, 580.5 * _scaleY),
      Path()
        ..moveTo(1230.46 * _scaleX, 580.5 * _scaleY)
        ..cubicTo(1163.5 * _scaleX, 583.5 * _scaleY, 1156.5 * _scaleX,
            513.5 * _scaleY, 1169.46 * _scaleX, 461.5 * _scaleY)
        ..cubicTo(1175.46 * _scaleX, 440.5 * _scaleY, 1198.06 * _scaleX,
            398.5 * _scaleY, 1240.46 * _scaleX, 398.5 * _scaleY)
        ..cubicTo(1293.46 * _scaleX, 398.5 * _scaleY, 1289.46 * _scaleX,
            424 * _scaleY, 1327.46 * _scaleX, 423 * _scaleY)
        ..cubicTo(1357.86 * _scaleX, 422.2 * _scaleY, 1381.79 * _scaleX,
            401.333 * _scaleY, 1389.96 * _scaleX, 391 * _scaleY),
    ];

    _generatePathInfo();
  }

  void _generatePathInfo() {
    for (var path in paths) {
      _combinedPath.addPath(path, Offset.zero);
    }

    _totalPathLength = _combinedPath.computeMetrics().fold(
          0.0,
          (sum, metric) => sum + metric.length,
        );
  }
}
