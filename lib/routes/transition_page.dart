import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage transitionPage({
  required Widget child,
  required AxisDirection direction,
}) {
  late Offset beginOffset;

  switch (direction) {
    case AxisDirection.up:
      beginOffset = const Offset(0, 1);
      break;

    case AxisDirection.down:
      beginOffset = const Offset(0, -1);
      break;

    case AxisDirection.right:
      beginOffset = const Offset(-1, 0);
      break;

    case AxisDirection.left:
      beginOffset = const Offset(1, 0);
      break;
  }

  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
