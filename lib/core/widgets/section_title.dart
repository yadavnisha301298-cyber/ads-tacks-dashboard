import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// A consistent heading used above dashboard sections and cards.
class SectionTitle extends StatelessWidget {
  const SectionTitle(
    this.title, {
    super.key,
    this.color,
    this.trailing,
    this.style,
  });

  final String title;
  final Color? color;
  final Widget? trailing;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final TextStyle effective = (style ?? Theme.of(context).textTheme.titleLarge!)
        .copyWith(color: color);
    final Widget label = Text(title, style: effective);

    if (trailing == null) return label;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(child: label),
        const SizedBox(width: AppSpacing.sm),
        trailing!,
      ],
    );
  }
}
