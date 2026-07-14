import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasource/dashboard_local_datasource.dart';
import '../models/model_mappers.dart';

/// Concrete [DashboardRepository] backed by a local data source.
///
/// Its job is to (a) call the data source, (b) map models to domain entities,
/// and (c) translate low-level exceptions into typed [Failure]s.
class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl(this._localDataSource);

  final DashboardLocalDataSource _localDataSource;

  @override
  Future<Result<DashboardData>> getDashboardData() async {
    try {
      final DashboardData data =
          (await _localDataSource.fetchDashboard()).toEntity();
      return Result<DashboardData>.success(data);
    } on CacheException catch (e) {
      return Result<DashboardData>.failure(CacheFailure(e.message));
    } on ParseException catch (e) {
      return Result<DashboardData>.failure(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Result<DashboardData>.failure(ServerFailure(e.message));
    } catch (e) {
      return Result<DashboardData>.failure(UnknownFailure(e.toString()));
    }
  }
}
