import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_dashboard/app.dart';
import 'package:office_dashboard/core/di/injection.dart';
import 'package:office_dashboard/core/services/asset_bundle_service.dart';

/// Fake bundle returning an in-memory payload so widget tests are deterministic
/// (no real asset I/O, no network fonts).
class _FakeBundle implements AssetBundleService {
  @override
  Future<Map<String, dynamic>> loadJson(String path) async => _payload;
}

const Map<String, dynamic> _payload = <String, dynamic>{
  'user': <String, dynamic>{'name': 'Pooja Mishra', 'role': 'Admin'},
  'hero': <String, dynamic>{
    'tag': 'ETHEREUM 2.0',
    'title': 'Top Rating Project',
    'description': 'Trending project and high rating Project Created by team.',
  },
  'projects': <dynamic>[
    <String, dynamic>{
      'id': 'p1',
      'title': 'Technology behind the Blockchain',
      'project_number': 'Project #1',
      'subtitle': 'See project details',
      'is_featured': true,
    },
  ],
  'creators': <dynamic>[
    <String, dynamic>{
      'id': 'c1',
      'username': '@maddison_c21',
      'artworks': 9821,
      'rating': 0.9,
    },
  ],
  'performance': <dynamic>[
    <String, dynamic>{'year': 2015, 'pending': 24.0, 'done': 22.0},
    <String, dynamic>{'year': 2016, 'pending': 34.0, 'done': 18.0},
  ],
  'calendar': <String, dynamic>{
    'year': 2023,
    'month': 10,
    'today': 27,
    'highlighted_days': <int>[27, 30],
    'schedule_label': 'GENERAL 10:00 AM TO 7:00 PM',
  },
  'birthdays': <String, dynamic>{
    'title': 'Today Birthday',
    'people': <dynamic>[
      <String, dynamic>{'id': 'b1', 'name': 'Riya'},
    ],
  },
  'anniversaries': <String, dynamic>{
    'title': 'Anniversary',
    'people': <dynamic>[
      <String, dynamic>{'id': 'a1', 'name': 'Neha'},
    ],
  },
};

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  Future<void> pumpAt(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          assetBundleServiceProvider.overrideWithValue(_FakeBundle()),
        ],
        child: const OfficeDashboardApp(),
      ),
    );
    // Resolve the (now-synchronous) provider and advance entrance animations.
    // pumpAndSettle is avoided because fl_chart continuously schedules frames.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump(const Duration(seconds: 1));
  }

  testWidgets('desktop layout renders hero and all sections',
      (WidgetTester tester) async {
    await pumpAt(tester, const Size(1600, 1200));

    expect(find.text('Top Rating Project'), findsOneWidget);
    expect(find.text('All Projects'), findsOneWidget);
    expect(find.text('Top Creators'), findsOneWidget);
    expect(find.text('Home'), findsWidgets);
  });

  testWidgets('tablet layout renders the dashboard',
      (WidgetTester tester) async {
    await pumpAt(tester, const Size(900, 1300));
    expect(find.text('Top Rating Project'), findsOneWidget);
    expect(find.text('All Projects'), findsOneWidget);
  });

  testWidgets('mobile layout renders the dashboard',
      (WidgetTester tester) async {
    await pumpAt(tester, const Size(420, 1600));
    expect(find.text('Top Rating Project'), findsOneWidget);
    expect(find.text('All Projects'), findsOneWidget);
  });
}
