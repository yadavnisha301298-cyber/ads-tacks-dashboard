import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../extensions/context_extensions.dart';

/// A pill/rounded button with a gradient fill, used for the "Wishing" CTAs and
/// other primary actions on the dark panels.
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.gradient,
    this.expand = false,
    this.borderRadius = AppRadius.brMd,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final List<Color>? gradient;
  final bool expand;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = gradient ?? context.dashboard.purpleButtonGradient;

    final Widget content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (icon != null) ...<Widget>[
          Icon(icon, size: 18, color: Colors.white),
          const SizedBox(width: AppSpacing.xs),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: context.text.labelLarge?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );

    return Semantics(
      button: true,
      label: label,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: borderRadius,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: colors.last.withValues(alpha: 0.35),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: borderRadius,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm + 2,
              ),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
