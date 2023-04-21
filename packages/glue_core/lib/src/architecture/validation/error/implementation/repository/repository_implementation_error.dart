part of glue_core;

class RepositoryImplementationError<R extends Repository>
    extends ImplementationError {
  final R repository;

  RepositoryImplementationError(
      {required this.repository, String? message, String? detail})
      : super(
            message: message ?? 'Fails on ${repository.runtimeType}.',
            detail: detail);
}
