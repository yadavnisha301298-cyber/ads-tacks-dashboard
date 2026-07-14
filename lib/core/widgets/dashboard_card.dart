import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../extensions/context_extensions.dart';

/// The base surface used by every panel on the dashboard.
///
/// Handles background colour, rounded corners, padding and the shared drop
/// shadow so individual sections never re-implement card chrome.
class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.color,
    this.gradient,
    this.borderRadius = AppRadius.brXl,
    this.withShadow = true,
    this.clip = Clip.antiAlias,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Gradient? gradient;
  final BorderRadius borderRadius;
  final bool withShadow;
  final Clip clip;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? context.colors.surface) : null,
        gradient: gradient,
        borderRadius: borderRadius,
        boxShadow: withShadow ? context.dashboard.cardShadow : null,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: clip,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
