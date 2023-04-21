part of glue_core;

class EntityNotFoundRepositoryImplementationError<ID extends Identifier,
    E extends Entity<ID>> extends RepositoryImplementationError {
  Identifier? id;
  Set<Identifier>? ids;

  EntityNotFoundRepositoryImplementationError.byId(
      {required this.id,
      required super.repository,
      String? message,
      String? detail})
      : super(
            message: message ??
                'Not found entity of type (${E.runtimeType}) by id: $id on ${repository.runtimeType}.',
            detail: detail);

  EntityNotFoundRepositoryImplementationError.byIds(
      {required Set<Identifier> ids,
      required super.repository,
      String? message,
      String? detail})
      : super(
            message: message ??
                'Not found entities of type (${E.runtimeType}) by ids: ${ids.toString()} on ${repository.runtimeType}.',
            detail: detail);

  //TODO: By Field
}
