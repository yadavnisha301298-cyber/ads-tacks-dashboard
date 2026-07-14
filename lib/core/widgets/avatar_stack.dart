import 'package:flutter/material.dart';

import 'profile_avatar.dart';

/// Renders a horizontal row of avatars for the birthday/anniversary cards.
///
/// If there are more avatars than [maxVisible], a "+N" chip is appended.
class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.names,
    this.imageUrls = const <String?>[],
    this.radius = 26,
    this.spacing = 12,
    this.maxVisible = 4,
  });

  final List<String> names;
  final List<String?> imageUrls;
  final double radius;
  final double spacing;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    final int visible = names.length < maxVisible ? names.length : maxVisible;
    final int overflow = names.length - visible;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: <Widget>[
        for (int i = 0; i < visible; i++)
          ProfileAvatar(
            name: names[i],
            imageUrl: i < imageUrls.length ? imageUrls[i] : null,
            radius: radius,
          ),
        if (overflow > 0)
          CircleAvatar(
            radius: radius,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              '+$overflow',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
