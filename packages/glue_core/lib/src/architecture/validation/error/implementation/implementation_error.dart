part of glue_core;

class ImplementationError extends ApplicationError {
  ImplementationError({required String message, String? detail})
      : super(message: message, detail: detail);
}
