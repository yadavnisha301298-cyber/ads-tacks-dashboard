import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/hover_scale.dart';
import '../../domain/entities/project.dart';

/// A single row in the "All Projects" list.
///
/// The [Project.isFeatured] entry is rendered with the red highlight from the
/// design; the rest use the elevated navy surface.
class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key, required this.project, this.onTap, this.onEdit});

  final Project project;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final bool featured = project.isFeatured;
    final Color textColor = context.dashboard.panelText;
    final Color subColor =
        featured ? Colors.white70 : context.dashboard.panelTextMuted;

    return HoverScale(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadius.brLg,
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: AppRadius.brLg,
              gradient: featured
                  ? const LinearGradient(
                      colors: <Color>[Color(0xFFF15B6C), Color(0xFFE8506B)],
                    )
                  : null,
              color: featured ? null : context.dashboard.panelElevated,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                children: <Widget>[
                  _Thumbnail(url: project.thumbnailUrl, featured: featured),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          project.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.titleSmall?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(text: '${project.projectNumber}  •  '),
                              TextSpan(
                                text: project.subtitle,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodySmall?.copyWith(color: subColor),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onEdit,
                    tooltip: 'Edit project',
                    iconSize: 18,
                    icon: Icon(Icons.edit_outlined, color: textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  const _Thumbnail({required this.url, required this.featured});

  final String url;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    const double size = 44;
    return ClipRRect(
      borderRadius: AppRadius.brMd,
      child: SizedBox(
        width: size,
        height: size,
        child: url.isNotEmpty
            ? Image.asset(url, fit: BoxFit.cover, errorBuilder: _fallback)
            : _fallback(context, Object, null),
      ),
    );
  }

  Widget _fallback(BuildContext context, Object error, StackTrace? stack) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: featured
              ? const <Color>[Colors.white24, Colors.white10]
              : const <Color>[AppColors.primary, AppColors.primaryDark],
        ),
      ),
      child: const Icon(Icons.grid_view_rounded, color: Colors.white, size: 20),
    );
  }
}
