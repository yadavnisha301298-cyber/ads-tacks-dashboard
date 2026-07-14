import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

/// A circular avatar that renders a network/asset image when available and
/// falls back to a coloured monogram derived from [name].
///
/// Keeping the fallback logic here means no screen ever shows a broken image.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 20,
    this.borderColor,
    this.borderWidth = 0,
  });

  final String name;
  final String? imageUrl;
  final double radius;
  final Color? borderColor;
  final double borderWidth;

  String get _initials {
    final List<String> parts =
        name.trim().replaceAll(RegExp('[@_.]'), ' ').split(RegExp(r'\s+'));
    final Iterable<String> letters =
        parts.where((String p) => p.isNotEmpty).take(2).map((String p) => p[0]);
    return letters.join().toUpperCase();
  }

  Color _colorFromName(BuildContext context) {
    final List<Color> palette = <Color>[
      context.colors.primary,
      context.colors.secondary,
      context.colors.tertiary,
      context.dashboard.chartDone,
    ];
    return palette[name.hashCode.abs() % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final Color bg = _colorFromName(context);
    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: bg.withValues(alpha: 0.18),
      foregroundImage: (imageUrl != null && imageUrl!.isNotEmpty)
          ? _resolveImage(imageUrl!)
          : null,
      child: Text(
        _initials,
        style: context.text.labelMedium?.copyWith(
          color: bg,
          fontWeight: FontWeight.w700,
          fontSize: radius * 0.7,
        ),
      ),
    );

    if (borderWidth > 0) {
      avatar = Container(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ?? context.colors.primary,
            width: borderWidth,
          ),
        ),
        child: avatar,
      );
    }
    return avatar;
  }

  ImageProvider<Object> _resolveImage(String url) {
    if (url.startsWith('http')) return NetworkImage(url);
    return AssetImage(url);
  }
}
