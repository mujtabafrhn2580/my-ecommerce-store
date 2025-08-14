import 'package:flutter/material.dart';

/// Custom clipper for creating a path with curved edges.
class TCustomCurvedClippedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    // Define the first quadratic bezier curve
    final firstControlCurve = Offset(0, size.height - 20);
    final firstEndCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
      firstControlCurve.dx,
      firstControlCurve.dy,
      firstEndCurve.dx,
      firstEndCurve.dy,
    );

    // Define the second quadratic bezier curve
    final secondControlCurve = Offset(0, size.height - 20);
    final secondEndCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
      secondControlCurve.dx,
      secondControlCurve.dy,
      secondEndCurve.dx,
      secondEndCurve.dy,
    );

    // Define the third quadratic bezier curve
    final thirdControlCurve = Offset(size.width, size.height - 20);
    final thirdEndCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
      thirdControlCurve.dx,
      thirdControlCurve.dy,
      thirdEndCurve.dx,
      thirdEndCurve.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // Always reclip to update the path when needed
    return true;
  }
}
