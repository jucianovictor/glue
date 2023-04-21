part of glue_core;

class PersistenceRepositoryImplementationError<D extends Domain>
    extends RepositoryImplementationError {
  final Domain domain;

  PersistenceRepositoryImplementationError(
      {required this.domain,
      required super.repository,
      String? message,
      required String detail})
      : super(
            message: message ??
                '$domain persistence failed on ${repository.runtimeType}.',
            detail: detail);
}
