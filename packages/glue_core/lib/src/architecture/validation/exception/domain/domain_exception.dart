part of glue_core;

class DomainException extends ApplicationException {
  DomainException({required String message, String? tip})
      : super(message: message, tip: tip);
}
