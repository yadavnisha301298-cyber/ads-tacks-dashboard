import 'package:flutter/material.dart';

import '../../domain/entities/person.dart';
import 'celebration_card.dart';

/// The "Anniversary" panel — a thin wrapper over [CelebrationCard].
class AnniversaryCard extends StatelessWidget {
  const AnniversaryCard({super.key, required this.group, this.onWish});

  final CelebrationGroup group;
  final VoidCallback? onWish;

  @override
  Widget build(BuildContext context) {
    return CelebrationCard(
      group: group,
      ctaLabel: 'Anniversary Wishing',
      onCtaPressed: onWish,
    );
  }
}
