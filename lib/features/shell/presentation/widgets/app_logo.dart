import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';

/// The "AS Adstacks" wordmark shown at the top of the sidebar.
///
/// Rendered with widgets (rather than a raster asset) so it stays crisp at any
/// size and adapts to the active theme.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final Widget mark = ShaderMask(
      shaderCallback: (Rect bounds) => const LinearGradient(
        colors: <Color>[AppColors.accentRed, AppColors.primary],
      ).createShader(bounds),
      child: Text(
        'AS',
        style: context.text.headlineSmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: -1,
        ),
      ),
    );

    if (compact) return mark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        mark,
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                text: 'Ad',
                style: TextStyle(color: context.colors.error),
              ),
              TextSpan(
                text: 'stacks',
                style: TextStyle(color: context.colors.primary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
