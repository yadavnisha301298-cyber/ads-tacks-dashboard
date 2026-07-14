import 'package:flutter_test/flutter_test.dart';
import 'package:office_dashboard/core/errors/exceptions.dart';
import 'package:office_dashboard/core/errors/failure.dart';
import 'package:office_dashboard/core/services/asset_bundle_service.dart';
import 'package:office_dashboard/core/utils/result.dart';
import 'package:office_dashboard/features/dashboard/data/datasource/dashboard_local_datasource.dart';
import 'package:office_dashboard/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:office_dashboard/features/dashboard/domain/entities/dashboard_data.dart';

/// A fake bundle so the data layer can be tested without the real asset system.
class _FakeBundle implements AssetBundleService {
  _FakeBundle(this._payload, {this.throwError = false});

  final Map<String, dynamic> _payload;
  final bool throwError;

  @override
  Future<Map<String, dynamic>> loadJson(String path) async {
    if (throwError) throw const CacheException('boom');
    return _payload;
  }
}

Map<String, dynamic> _validPayload() => <String, dynamic>{
      'user': <String, dynamic>{'name': 'Pooja', 'role': 'Admin'},
      'hero': <String, dynamic>{
        'tag': 'ETH',
        'title': 'Top',
        'description': 'desc',
      },
      'projects': <dynamic>[],
      'creators': <dynamic>[],
      'performance': <dynamic>[],
      'calendar': <String, dynamic>{
        'year': 2023,
        'month': 10,
        'today': 27,
      },
      'birthdays': <String, dynamic>{'title': 'Birthday', 'people': <dynamic>[]},
      'anniversaries': <String, dynamic>{
        'title': 'Anniversary',
        'people': <dynamic>[],
      },
    };

void main() {
  test('maps a valid payload to a DashboardData entity', () async {
    final DashboardRepositoryImpl repo = DashboardRepositoryImpl(
      DashboardLocalDataSourceImpl(_FakeBundle(_validPayload())),
    );

    final Result<DashboardData> result = await repo.getDashboardData();

    final DashboardData data = (result as Success<DashboardData>).value;
    expect(data.user.name, 'Pooja');
    expect(data.calendar.today, 27);
  });

  test('returns a CacheFailure when the bundle throws', () async {
    final DashboardRepositoryImpl repo = DashboardRepositoryImpl(
      DashboardLocalDataSourceImpl(
        _FakeBundle(<String, dynamic>{}, throwError: true),
      ),
    );

    final Result<DashboardData> result = await repo.getDashboardData();

    expect(result, isA<FailureResult<DashboardData>>());
    expect((result as FailureResult<DashboardData>).failure, isA<CacheFailure>());
  });
}
