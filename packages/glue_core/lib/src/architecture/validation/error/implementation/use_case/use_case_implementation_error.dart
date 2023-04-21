part of glue_core;

class UseCaseExecutionImplementationError extends ImplementationError {
  UseCaseExecutionImplementationError(
      {required UseCase useCase, String? message, required super.detail})
      : super(message: message ?? '${useCase.runtimeType}: execution fails.');
}
