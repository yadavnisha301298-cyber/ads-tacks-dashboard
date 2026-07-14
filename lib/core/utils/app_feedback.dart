import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Small helper for transient user feedback (toast-style snackbars).
///
/// Centralising this keeps every "demo" interaction consistent and avoids
/// repeating `ScaffoldMessenger` boilerplate across widgets.
abstract final class AppFeedback {
  const AppFeedback._();

  /// Shows a floating snackbar, replacing any currently visible one.
  static void toast(BuildContext context, String message, {IconData? icon}) {
    final ThemeData theme = Theme.of(context);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          backgroundColor: theme.colorScheme.inverseSurface,
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.brMd),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(icon, size: 18, color: theme.colorScheme.onInverseSurface),
                const SizedBox(width: AppSpacing.sm),
              ],
              Flexible(
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.onInverseSurface),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
