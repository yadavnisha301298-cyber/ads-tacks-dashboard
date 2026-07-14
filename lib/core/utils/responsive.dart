import 'package:flutter/widgets.dart';

import '../constants/app_constants.dart';

/// The device class the current layout should adapt to.
enum DeviceType { mobile, tablet, desktop }

/// Pure helpers for reasoning about the current screen size.
///
/// Kept free of widgets so it can be unit-tested and reused by controllers.
abstract final class Responsive {
  const Responsive._();

  static DeviceType deviceTypeFor(double width) {
    if (width < AppBreakpoints.mobile) return DeviceType.mobile;
    if (width < AppBreakpoints.tablet) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  static DeviceType of(BuildContext context) =>
      deviceTypeFor(MediaQuery.sizeOf(context).width);

  static bool isMobile(BuildContext context) => of(context) == DeviceType.mobile;
  static bool isTablet(BuildContext context) => of(context) == DeviceType.tablet;
  static bool isDesktop(BuildContext context) =>
      of(context) == DeviceType.desktop;
}

/// A declarative way to pick a value per device class.
///
/// ```dart
/// final columns = const ResponsiveValue(mobile: 1, tablet: 2, desktop: 3)
///     .resolve(context);
/// ```
class ResponsiveValue<T> {
  const ResponsiveValue({
    required this.mobile,
    T? tablet,
    T? desktop,
  })  : _tablet = tablet,
        _desktop = desktop;

  final T mobile;
  final T? _tablet;
  final T? _desktop;

  T get tablet => _tablet ?? mobile;
  T get desktop => _desktop ?? tablet;

  T resolve(BuildContext context) => resolveFor(Responsive.of(context));

  T resolveFor(DeviceType type) => switch (type) {
        DeviceType.mobile => mobile,
        DeviceType.tablet => tablet,
        DeviceType.desktop => desktop,
      };
}
