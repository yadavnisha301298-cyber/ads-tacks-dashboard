import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';

/// A single tappable row in the sidebar navigation.
///
/// Animates its background, icon and label colour based on [selected] and
/// supports an optional [collapsed] (icon-only) presentation for tablets.
class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onTap,
    this.collapsed = false,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final VoidCallback onTap;
  final bool collapsed;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = context.colors.primary;
    final Color idleColor = context.colors.onSurfaceVariant;
    final Color contentColor = selected ? context.colors.onSurface : idleColor;

    return Semantics(
      selected: selected,
      button: true,
      label: label,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
        decoration: BoxDecoration(
          color: selected
              ? context.dashboard.activeNavBackground
              : Colors.transparent,
          borderRadius: AppRadius.brMd,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: AppRadius.brMd,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: collapsed ? 0 : AppSpacing.md,
                vertical: AppSpacing.sm + 2,
              ),
              child: Row(
                mainAxisAlignment: collapsed
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    selected ? selectedIcon : icon,
                    color: selected ? activeColor : idleColor,
                    size: 24,
                  ),
                  if (!collapsed) ...<Widget>[
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.titleSmall?.copyWith(
                          color: contentColor,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
