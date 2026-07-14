import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../extensions/context_extensions.dart';

/// A friendly "coming soon" scaffold used by the secondary routes that are not
/// part of the pixel-perfect Home design but are wired for navigation.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
    required this.title,
    required this.icon,
    this.description = 'This section is part of the office dashboard roadmap.',
  });

  final String title;
  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: context.colors.primary),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(title, style: context.text.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: context.text.bodyMedium
                    ?.copyWith(color: context.colors.onSurfaceVariant),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
