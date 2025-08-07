import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart'; // Make sure this is imported

class SkeletonizerContainer extends StatelessWidget {
  const SkeletonizerContainer({
    super.key,
    required this.child,
    required this.enabled,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.withValues(alpha: 0.07),
        highlightColor: Colors.grey.withValues(alpha: 0.15),
      ),
      child: child,
    );
  }
}
