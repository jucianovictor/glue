part of glue_core;

class UnexpectedError extends ApplicationError {
  Error? originalError;
  Exception? originalException;
  Object? originalObject;
  String get className => runtimeType.toString();

  UnexpectedError({required String message, String? detail})
      : super(message: message, detail: detail);
  UnexpectedError.fromException(
      {required this.originalException, String? detail})
      : super(message: originalException.toString(), detail: detail);
  UnexpectedError.fromError({required this.originalError, String? detail})
      : super(message: originalError.toString(), detail: detail);
  UnexpectedError.fromObject({required this.originalObject, String? detail})
      : super(message: originalObject.toString(), detail: detail);
}
