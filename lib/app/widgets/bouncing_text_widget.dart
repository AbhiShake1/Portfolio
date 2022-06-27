import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BouncingTextWidget extends HookWidget {
  final Text textWidget;
  final double scaleFactor;
  final Duration duration;

  const BouncingTextWidget({
    Key? key,
    required this.textWidget,
    this.scaleFactor = 1,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: duration,
      lowerBound: 0,
      upperBound: .1,
    );

    final scale = useAnimation(controller);

    return MouseRegion(
      onEnter: (_) async {
        await controller.forward();
        Future.delayed(duration, controller.reverse);
      },
      child: Transform.scale(
        scale: 1 - (scale * scaleFactor),
        child: textWidget,
      ),
    );
  }
}
