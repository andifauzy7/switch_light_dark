import 'dart:math' as math;
import 'package:flutter/material.dart';

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var path = Path();

    var radius = size.width / 4;
    var inner = radius / 2;
    var rotation = math.pi / 2 * 3;
    var step = math.pi / 4;

    path.lineTo(centerX, centerY - radius);

    for (var i = 0; i < 4; i++) {
      var x = centerX + math.cos(rotation) * radius;
      var y = centerY + math.sin(rotation) * radius;
      path.lineTo(x, y);
      rotation += step;

      x = centerX + math.cos(rotation) * inner;
      y = centerY + math.sin(rotation) * inner;
      path.lineTo(x, y);
      rotation += step;
    }

    path.lineTo(centerX, centerY - radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
