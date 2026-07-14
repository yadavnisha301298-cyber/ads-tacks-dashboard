import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/injection.dart';
import '../../data/datasource/dashboard_local_datasource.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_data.dart';

/// Wires the dashboard feature's dependency graph and exposes the async state
/// the presentation layer consumes. No business logic lives in widgets — they
/// simply `watch` these providers.

final Provider<DashboardLocalDataSource> _localDataSourceProvider =
    Provider<DashboardLocalDataSource>(
  (Ref ref) => DashboardLocalDataSourceImpl(ref.watch(assetBundleServiceProvider)),
);

final Provider<DashboardRepository> dashboardRepositoryProvider =
    Provider<DashboardRepository>(
  (Ref ref) => DashboardRepositoryImpl(ref.watch(_localDataSourceProvider)),
);

final Provider<GetDashboardData> getDashboardDataProvider =
    Provider<GetDashboardData>(
  (Ref ref) => GetDashboardData(ref.watch(dashboardRepositoryProvider)),
);

/// The single source of async dashboard state for the home screen.
///
/// Emits loading / data / error which the UI renders via `.when(...)`.
final FutureProvider<DashboardData> dashboardDataProvider =
    FutureProvider<DashboardData>((Ref ref) async {
  final GetDashboardData usecase = ref.watch(getDashboardDataProvider);
  final result = await usecase();
  return result.when(
    success: (DashboardData data) => data,
    failure: (failure) => throw Exception(failure.message),
  );
});
