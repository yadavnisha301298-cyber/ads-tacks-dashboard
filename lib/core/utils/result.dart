import '../errors/failure.dart';

/// A lightweight, dependency-free `Either`-style result type.
///
/// Use cases and repositories return `Result<T>` so the presentation layer can
/// exhaustively handle success and failure without exceptions crossing layers.
sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success<T>;
  const factory Result.failure(Failure failure) = FailureResult<T>;

  /// Folds both branches into a single value of type [R].
  R when<R>({
    required R Function(T value) success,
    required R Function(Failure failure) failure,
  }) {
    final Result<T> self = this;
    return switch (self) {
      Success<T>(:final T value) => success(value),
      FailureResult<T>(failure: final Failure f) => failure(f),
    };
  }
}

class Success<T> extends Result<T> {
  const Success(this.value);
  final T value;
}

class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);
  final Failure failure;
}
