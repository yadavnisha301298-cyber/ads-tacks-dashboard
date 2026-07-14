/// Global, framework-agnostic constants for the application.
///
/// Centralising these values keeps the UI free of "magic numbers" and makes
/// the design system easy to tune from a single place.
library;

import 'package:flutter/widgets.dart';

/// Named responsive breakpoints (logical pixels).
///
/// The values mirror the assignment brief:
/// mobile `< 600`, tablet `600–1024`, desktop `> 1024`.
abstract final class AppBreakpoints {
  const AppBreakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

/// Consistent spacing scale (4-pt grid).
abstract final class AppSpacing {
  const AppSpacing._();

  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const EdgeInsets pageMobile = EdgeInsets.all(md);
  static const EdgeInsets pageDesktop = EdgeInsets.all(lg);
}

/// Corner radii used across cards, buttons and inputs.
abstract final class AppRadius {
  const AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 28;
  static const double pill = 999;

  static const Radius rSm = Radius.circular(sm);
  static const Radius rMd = Radius.circular(md);
  static const Radius rLg = Radius.circular(lg);
  static const Radius rXl = Radius.circular(xl);

  static const BorderRadius brSm = BorderRadius.all(rSm);
  static const BorderRadius brMd = BorderRadius.all(rMd);
  static const BorderRadius brLg = BorderRadius.all(rLg);
  static const BorderRadius brXl = BorderRadius.all(rXl);
}

/// Animation durations used throughout the app for a consistent feel.
abstract final class AppDurations {
  const AppDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration chart = Duration(milliseconds: 900);
}

/// Fixed layout sizes that are intentional design decisions.
abstract final class AppSizes {
  const AppSizes._();

  static const double sidebarWidth = 264;
  static const double sidebarCollapsedWidth = 88;
  static const double rightPanelWidth = 340;
  static const double topBarHeight = 88;
  static const double avatarSm = 32;
  static const double avatarMd = 40;
  static const double avatarLg = 96;
  static const double maxContentWidth = 1600;
}
