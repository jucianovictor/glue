part of glue_core;

class UnableConnectRepository<R extends Repository>
    extends ApplicationException {
  UnableConnectRepository(
      {required R currentRepository, String? message, String? tip})
      : super(
            message: message ??
                'Unable to connect to ${currentRepository.datasource.type}',
            tip: tip);
}
