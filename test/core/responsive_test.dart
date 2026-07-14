import 'package:flutter_test/flutter_test.dart';
import 'package:office_dashboard/core/utils/responsive.dart';

void main() {
  group('Responsive.deviceTypeFor', () {
    test('classifies widths into the correct device buckets', () {
      expect(Responsive.deviceTypeFor(360), DeviceType.mobile);
      expect(Responsive.deviceTypeFor(599), DeviceType.mobile);
      expect(Responsive.deviceTypeFor(600), DeviceType.tablet);
      expect(Responsive.deviceTypeFor(1023), DeviceType.tablet);
      expect(Responsive.deviceTypeFor(1024), DeviceType.desktop);
      expect(Responsive.deviceTypeFor(1920), DeviceType.desktop);
    });
  });

  group('ResponsiveValue', () {
    const ResponsiveValue<int> columns =
        ResponsiveValue<int>(mobile: 1, tablet: 2, desktop: 3);

    test('resolves per device type', () {
      expect(columns.resolveFor(DeviceType.mobile), 1);
      expect(columns.resolveFor(DeviceType.tablet), 2);
      expect(columns.resolveFor(DeviceType.desktop), 3);
    });

    test('falls back to smaller breakpoints when unspecified', () {
      const ResponsiveValue<int> onlyMobile = ResponsiveValue<int>(mobile: 5);
      expect(onlyMobile.resolveFor(DeviceType.tablet), 5);
      expect(onlyMobile.resolveFor(DeviceType.desktop), 5);
    });
  });
}
