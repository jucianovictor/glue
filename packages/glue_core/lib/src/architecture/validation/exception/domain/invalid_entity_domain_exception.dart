part of glue_core;

class InvalidEntityDomainException<E extends Entity> extends DomainException {
  InvalidEntityDomainException({required String message})
      : super(message: message);
}
