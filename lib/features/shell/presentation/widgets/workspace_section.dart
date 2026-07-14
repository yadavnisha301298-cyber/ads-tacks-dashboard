import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_feedback.dart';

/// A workspace and its selectable channels/boards, used to seed the demo menu.
class _Workspace {
  const _Workspace(this.name, this.items);
  final String name;
  final List<String> items;
}

/// The "WORKSPACES" group in the sidebar. Each workspace expands/collapses to
/// reveal dummy sub-options; selecting one shows a toast. This satisfies the
/// requirement that collapsible menu entries reveal options on click.
class WorkspaceSection extends StatefulWidget {
  const WorkspaceSection({super.key});

  @override
  State<WorkspaceSection> createState() => _WorkspaceSectionState();
}

class _WorkspaceSectionState extends State<WorkspaceSection> {
  static const List<_Workspace> _workspaces = <_Workspace>[
    _Workspace('Adstacks', <String>['Overview', 'Campaigns', 'Reports']),
    _Workspace('Finance', <String>['Invoices', 'Payroll', 'Budgets']),
  ];

  /// Index of the currently expanded workspace, or null when all collapsed.
  int? _expanded = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: context.dashboard.activeNavBackground,
            borderRadius: AppRadius.brMd,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  'WORKSPACES',
                  overflow: TextOverflow.ellipsis,
                  style: context.text.labelLarge?.copyWith(
                    letterSpacing: 0.5,
                    color: context.colors.onSurface,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              InkWell(
                borderRadius: AppRadius.brSm,
                onTap: () => AppFeedback.toast(
                  context,
                  'Create a new workspace (demo)',
                  icon: Icons.add_rounded,
                ),
                child: Tooltip(
                  message: 'Add workspace',
                  child: Icon(Icons.add_rounded, color: context.colors.primary),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        for (int i = 0; i < _workspaces.length; i++)
          _WorkspaceTile(
            workspace: _workspaces[i],
            expanded: _expanded == i,
            onToggle: () => setState(() => _expanded = _expanded == i ? null : i),
            onItemTap: (String item) => AppFeedback.toast(
              context,
              '${_workspaces[i].name} › $item (demo)',
              icon: Icons.workspaces_outline,
            ),
          ),
      ],
    );
  }
}

class _WorkspaceTile extends StatelessWidget {
  const _WorkspaceTile({
    required this.workspace,
    required this.expanded,
    required this.onToggle,
    required this.onItemTap,
  });

  final _Workspace workspace;
  final bool expanded;
  final VoidCallback onToggle;
  final ValueChanged<String> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          borderRadius: AppRadius.brMd,
          onTap: onToggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(workspace.name, style: context.text.titleSmall),
                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: AppDurations.fast,
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: AppDurations.medium,
          sizeCurve: Curves.easeInOut,
          crossFadeState:
              expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final String item in workspace.items)
                InkWell(
                  borderRadius: AppRadius.brSm,
                  onTap: () => onItemTap(item),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.xl,
                      top: AppSpacing.xs,
                      bottom: AppSpacing.xs,
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.circle,
                          size: 6,
                          color: context.colors.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          item,
                          style: context.text.bodyMedium?.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          secondChild: const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}
