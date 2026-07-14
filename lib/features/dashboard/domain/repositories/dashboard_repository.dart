import '../../../../core/utils/result.dart';
import '../entities/dashboard_data.dart';

/// Contract the presentation layer depends on. The data layer provides the
/// concrete implementation, keeping the dependency arrow pointing inward
/// (Dependency Inversion Principle).
abstract interface class DashboardRepository {
  /// Loads the full dashboard payload.
  Future<Result<DashboardData>> getDashboardData();
}
