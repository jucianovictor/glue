part of glue_core;

class InvalidValueDomainException<VO extends ValueObject>
    extends DomainException {
  InvalidValueDomainException({required String message})
      : super(message: message);
}
