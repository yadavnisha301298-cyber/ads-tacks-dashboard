import 'package:flutter/widgets.dart';

import '../utils/responsive.dart';

/// Chooses one of three builders based on the current [DeviceType].
///
/// Encourages *adaptive* layouts (different widget trees per breakpoint) rather
/// than merely scaling a single layout, as required by the brief.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final DeviceType type = Responsive.deviceTypeFor(constraints.maxWidth);
        return switch (type) {
          DeviceType.mobile => mobile(context),
          DeviceType.tablet => (tablet ?? desktop)(context),
          DeviceType.desktop => desktop(context),
        };
      },
    );
  }
}
