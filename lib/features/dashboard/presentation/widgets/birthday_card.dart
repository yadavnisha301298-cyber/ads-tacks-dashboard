import 'package:flutter/material.dart';

import '../../domain/entities/person.dart';
import 'celebration_card.dart';

/// The "Today Birthday" panel — a thin wrapper over [CelebrationCard].
class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key, required this.group, this.onWish});

  final CelebrationGroup group;
  final VoidCallback? onWish;

  @override
  Widget build(BuildContext context) {
    return CelebrationCard(
      group: group,
      ctaLabel: 'Birthday Wishing',
      onCtaPressed: onWish,
    );
  }
}
