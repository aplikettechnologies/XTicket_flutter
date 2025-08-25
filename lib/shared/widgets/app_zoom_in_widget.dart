import 'package:flutter/material.dart';

/// ZoomIn animation widget
class ZoomIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final Function(AnimateDoDirection direction)? onFinish;
  final double from;
  final Curve curve;

  ZoomIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = const Duration(milliseconds: 0),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.from = 1.0,
    this.onFinish,
    this.curve = Curves.easeInOutCubicEmphasized,
  }) {
    if (manualTrigger && controller == null) {
      throw FlutterError(
        'If you want to use manualTrigger:true, you must provide the controller callback:\n'
        '(controller: AnimationController) => yourController = controller',
      );
    }
  }

  @override
  _ZoomInState createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> zoom;
  late Animation<double> opacity;
  bool disposed = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    zoom = Tween<double>(
      begin: 0.0,
      end: widget.from,
    ).animate(CurvedAnimation(parent: controller, curve: widget.curve));

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25)),
    );

    widget.controller?.call(controller);

    if (widget.animate && !widget.manualTrigger) {
      Future.delayed(widget.delay, () {
        if (!disposed)
          controller.forward().then((_) {
            widget.onFinish?.call(AnimateDoDirection.forward);
          });
      });
    }
  }

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: zoom.value,
          child: Opacity(opacity: opacity.value, child: widget.child),
        );
      },
    );
  }
}

extension ZoomInExtension on Widget {
  Widget zoomIn({
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = const Duration(milliseconds: 0),
    Function(AnimationController)? controller,
    bool manualTrigger = false,
    bool animate = true,
    Function(AnimateDoDirection direction)? onFinish,
    double from = 1.0,
    Curve curve = Curves.easeInOutCubicEmphasized,
  }) {
    return ZoomIn(
      duration: duration,
      delay: delay,
      controller: controller,
      manualTrigger: manualTrigger,
      animate: animate,
      onFinish: onFinish,
      from: from,
      curve: curve,
      child: this,
    );
  }
}

enum AnimateDoDirection { forward, backward }
