/// Domain-level error type.
///
/// Repositories translate low-level [Exception]s into [Failure]s so upper layers
/// have a stable, presentable error contract.
sealed class Failure {
  const Failure(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// A failure originating from local storage / bundled assets.
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Could not load local data.']);
}

/// A failure originating from the network.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong on the server.']);
}

/// A catch-all for unexpected errors.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
