part of glue_core;

abstract class UseCaseOutput {
  final List<ApplicationException> _exceptions = [];
  final List<ApplicationError> _errors = [];

  List<ApplicationException> get applicationExceptions =>
      _exceptions.whereType<ApplicationException>().toList();

  List<ApplicationError> get applicationErrors =>
      _errors.whereType<ApplicationError>().toList();

  void addError(ApplicationError error) => _errors.add(error);
  void addException(ApplicationException exception) =>
      _exceptions.add(exception);
  void addErrors(List<ApplicationError> errors) => _errors.addAll(errors);
  void addExceptions(List<ApplicationException> exceptions) =>
      _exceptions.addAll(exceptions);

  bool get hasErrors => _errors.isNotEmpty;
  bool get hasExceptions => _exceptions.isNotEmpty;
  bool get hasApplicationExceptions => applicationExceptions.isNotEmpty;
  bool get hasDomainExceptions => applicationExceptions.isNotEmpty;
  bool get hasErrorsOrExceptions => hasErrors || hasExceptions;
  bool get isInvalid => hasErrorsOrExceptions;
  bool get isValid => !isInvalid;
}
