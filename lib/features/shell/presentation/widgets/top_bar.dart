import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/utils/app_feedback.dart';
import '../../../../core/widgets/app_search_bar.dart';
import '../../../../core/widgets/hover_scale.dart';
import '../../../../core/widgets/profile_avatar.dart';
import '../../../dashboard/domain/entities/dashboard_data.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';

/// The top application bar: page title, search, quick actions and the avatar.
///
/// Adapts by hiding the inline search on mobile (a search icon is shown
/// instead) and exposing a menu button to open the navigation drawer.
class TopBar extends ConsumerWidget {
  const TopBar({
    super.key,
    required this.title,
    this.onMenuTap,
  });

  final String title;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showInlineSearch = !context.isMobile;
    final String? avatarUrl = ref.watch(
      dashboardDataProvider.select(
        (AsyncValue<DashboardData> v) => v.valueOrNull?.user.avatarUrl,
      ),
    );
    final String userName = ref.watch(
          dashboardDataProvider.select(
            (AsyncValue<DashboardData> v) => v.valueOrNull?.user.name,
          ),
        ) ??
        'User';

    final double gap = context.isMobile ? AppSpacing.xs : AppSpacing.sm;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: <Widget>[
          if (onMenuTap != null)
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu_rounded),
              tooltip: 'Open navigation menu',
            ),
          // `Expanded` (not `Flexible` + `Spacer`) so the title consumes all the
          // free space and pushes the search + actions flush to the right edge.
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: context.text.headlineSmall,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          if (showInlineSearch)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: AppSearchBar(
                onSubmitted: (String q) => AppFeedback.toast(
                  context,
                  q.trim().isEmpty ? 'Type something to search' : 'Searching "$q"…',
                  icon: Icons.search_rounded,
                ),
              ),
            )
          else
            _CircleIconButton(
              icon: Icons.search_rounded,
              tooltip: 'Search',
              onTap: () => AppFeedback.toast(context, 'Search',
                  icon: Icons.search_rounded),
            ),
          SizedBox(width: gap),
          if (!context.isMobile) ...<Widget>[
            _CircleIconButton(
              icon: Icons.mark_email_unread_outlined,
              tooltip: 'Messages',
              badge: true,
              onTap: () => AppFeedback.toast(context, 'You have 3 new messages',
                  icon: Icons.mark_email_unread_outlined),
            ),
            SizedBox(width: gap),
          ],
          _CircleIconButton(
            icon: Icons.notifications_none_rounded,
            tooltip: 'Notifications',
            badge: true,
            onTap: () => AppFeedback.toast(context, 'You have 5 notifications',
                icon: Icons.notifications_none_rounded),
          ),
          SizedBox(width: gap),
          _CircleIconButton(
            icon: context.theme.brightness == Brightness.dark
                ? Icons.light_mode_outlined
                : Icons.power_settings_new_rounded,
            tooltip: 'Toggle theme',
            onTap: () => ref.read(themeControllerProvider.notifier).toggle(),
          ),
          SizedBox(width: gap),
          _ProfileMenu(userName: userName, avatarUrl: avatarUrl),
        ],
      ),
    );
  }
}

/// The avatar in the top-right, opening a small account menu of demo options.
class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu({required this.userName, this.avatarUrl});

  final String userName;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Account',
      offset: const Offset(0, 52),
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.brMd),
      onSelected: (String value) =>
          AppFeedback.toast(context, '$value (demo)', icon: Icons.check_rounded),
      itemBuilder: (BuildContext context) => const <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'View profile',
          child: _MenuRow(icon: Icons.person_outline_rounded, label: 'View profile'),
        ),
        PopupMenuItem<String>(
          value: 'Account settings',
          child: _MenuRow(icon: Icons.settings_outlined, label: 'Account settings'),
        ),
        PopupMenuDivider(),
        PopupMenuItem<String>(
          value: 'Log out',
          child: _MenuRow(icon: Icons.logout_rounded, label: 'Log out'),
        ),
      ],
      child: HoverScale(
        child: ProfileAvatar(
          name: userName,
          imageUrl: avatarUrl,
          radius: AppSizes.avatarMd / 2 + 2,
          borderColor: context.colors.primary,
          borderWidth: 2,
        ),
      ),
    );
  }
}

/// A leading-icon + label row used inside the account popup menu.
class _MenuRow extends StatelessWidget {
  const _MenuRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 18, color: context.colors.onSurfaceVariant),
        const SizedBox(width: AppSpacing.sm),
        Text(label, style: context.text.bodyMedium),
      ],
    );
  }
}

/// A rounded icon button with an optional notification dot, matching the design.
class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.tooltip,
    this.badge = false,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String? tooltip;
  final bool badge;

  @override
  Widget build(BuildContext context) {
    final Widget button = HoverScale(
      scale: 1.08,
      child: Material(
        color: context.colors.surface,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Icon(icon, size: 22, color: context.colors.onSurface),
          ),
        ),
      ),
    );

    if (!badge) return Tooltip(message: tooltip ?? '', child: button);

    return Tooltip(
      message: tooltip ?? '',
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          button,
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: context.colors.error,
                shape: BoxShape.circle,
                border: Border.all(color: context.colors.surface, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
