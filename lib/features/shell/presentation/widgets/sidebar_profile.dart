import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/profile_avatar.dart';

/// The avatar + name + role card shown near the top of the sidebar.
class SidebarProfile extends StatelessWidget {
  const SidebarProfile({
    super.key,
    required this.name,
    required this.role,
    required this.avatarUrl,
  });

  final String name;
  final String role;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfileAvatar(
          name: name,
          imageUrl: avatarUrl,
          radius: AppSizes.avatarLg / 2,
          borderColor: context.colors.secondary,
          borderWidth: 3,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          name,
          style: context.text.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xxs + 2,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.brXl,
            border: Border.all(color: context.colors.outline),
          ),
          child: Text(role, style: context.text.labelMedium),
        ),
      ],
    );
  }
}
