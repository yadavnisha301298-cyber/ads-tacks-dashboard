import 'package:flutter/material.dart';

import '../theme/dashboard_theme_extension.dart';
import '../utils/responsive.dart';

/// Ergonomic accessors on [BuildContext] for theme + responsiveness.
///
/// These keep widget code terse and readable, e.g. `context.colors.primary`
/// instead of `Theme.of(context).colorScheme.primary`.
extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;

  /// The bespoke dashboard tokens (gradients, navy panels, chart colours).
  DashboardColors get dashboard =>
      Theme.of(this).extension<DashboardColors>()!;

  Size get screenSize => MediaQuery.sizeOf(this);
  DeviceType get deviceType => Responsive.of(this);
  bool get isMobile => Responsive.isMobile(this);
  bool get isTablet => Responsive.isTablet(this);
  bool get isDesktop => Responsive.isDesktop(this);
}
