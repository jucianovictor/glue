part of glue_core;

class NoEntityFoundDomainException<E extends Entity> extends DomainException {
  NoEntityFoundDomainException({String? message, String? entityName})
      : super(message: message ?? 'No ${entityName ?? 'record'} found.');
}
