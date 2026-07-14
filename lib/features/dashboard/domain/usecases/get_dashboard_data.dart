import '../../../../core/utils/result.dart';
import '../entities/dashboard_data.dart';
import '../repositories/dashboard_repository.dart';

/// Single-responsibility use case that retrieves the dashboard data.
///
/// Even though it currently just delegates to the repository, encapsulating the
/// operation keeps the presentation layer decoupled from the repository API and
/// gives us a natural home for future orchestration (caching, merging, etc.).
class GetDashboardData {
  const GetDashboardData(this._repository);

  final DashboardRepository _repository;

  /// Callable form so it reads like a function: `await getDashboardData()`.
  Future<Result<DashboardData>> call() => _repository.getDashboardData();
}
