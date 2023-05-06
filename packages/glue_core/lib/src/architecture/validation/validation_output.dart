part of glue_core;

class ValidationOutput {
  final Validable _object;

  final List<ApplicationException> onlySuperficialExceptions = [];
  final List<ApplicationError> onlySuperficialErrors = [];

  final Set<int> _objectsReferenceInValidation;

  final Map<int, ValidationOutput> _validationOutputsByDepth = {};
  final int _currentDepth;

  ValidationOutput({required Validable object, ValidationInput? input})
      : _object = object,
        _currentDepth = input?.parentValidationOutput?._currentDepth != null
            ? input!.parentValidationOutput!._currentDepth + 1
            : 0,
        _objectsReferenceInValidation =
            input?.parentValidationOutput?._objectsReferenceInValidation ??
                <int>{object.hashCode} {
    _validationOutputsByDepth[0] = this;
  }

  void validateNestedObjects(List<Validable?>? validableObjects) {
    if (validableObjects == null) return;
    List<Validable?> objectsToValidate = validableObjects
        .where((validable) => !_isAlreadyInValidation(validable))
        .toList();

    _objectsReferenceInValidation
        .addAll(objectsToValidate.map((e) => e!.hashCode));

    objectsToValidate
        .map((e) =>
            e!.validate(input: ValidationInput(parentValidationOutput: this)))
        .where((output) => output.isInvalid)
        .forEach((validation) =>
            _validationOutputsByDepth[validation._currentDepth] = validation);
  }

  void validateNestedObject(Validable? domainObject) {
    if (domainObject != null &&
        !_objectsReferenceInValidation.contains(domainObject.hashCode)) {
      _objectsReferenceInValidation.add(domainObject.hashCode);
      ValidationOutput validation = domainObject.validate(
          input: ValidationInput(parentValidationOutput: this));

      if (validation.isInvalid) {
        _validationOutputsByDepth[validation._currentDepth] = validation;
      }
    }
  }

  void validateNestedObjectIf(bool condition, Validable? validable) {
    if (condition) {
      validateNestedObject(validable);
    }
  }

  void validateNestedObjectsIf(
      bool condition, List<Validable?>? validableObjects) {
    if (condition) {
      validateNestedObjects(validableObjects);
    }
  }

  void validateAsEntity() {
    if (_object is Entity)
      _validateEntity(_object as Entity);
    else
      onlySuperficialErrors.add(ImplementationError(
          message:
              'The utilized object must be an Entity to be validated as an Entity'));
  }

  void _validateEntity(Entity entity) {
    validateNestedObjectIf(entity.id != null, entity.id);
  }

  void addExceptionIf(bool condition, ApplicationException exception) {
    if (condition) {
      onlySuperficialExceptions.add(exception);
    }
  }

  void addExceptionFromMessageIf(bool condition, String message,
      [String? tip]) {
    if (condition) {
      onlySuperficialExceptions
          .add(ApplicationException(message: message, tip: tip));
    }
  }

  void addErrorIf(bool condition, Error error) {
    if (condition) {
      onlySuperficialErrors.add(error is ApplicationError
          ? error
          : UnexpectedError(message: error.toString()));
    }
  }

  void addIfThrow(Function throwableFunction) {
    try {
      throwableFunction();
    } catch (e) {
      if (e is ApplicationError)
        onlySuperficialErrors.add(e);
      else if (e is ApplicationException)
        onlySuperficialExceptions.add(e);
      else if (e is Error)
        onlySuperficialErrors.add(UnexpectedError.fromError(originalError: e));
      else if (e is Exception)
        onlySuperficialErrors
            .add(UnexpectedError.fromException(originalException: e));
      else
        onlySuperficialErrors
            .add(UnexpectedError.fromObject(originalObject: e));
    }
  }

  bool _isAlreadyInValidation(Validable? validable) =>
      validable != null &&
      _objectsReferenceInValidation.contains(validable.hashCode);

  int get highestDepth => _validationOutputsByDepth.keys.isEmpty
      ? _currentDepth
      : _validationOutputsByDepth.keys
          .reduce((value, object) => value > object ? value : object);

  List<ApplicationException> get onlyNestedExceptions =>
      _validationOutputsByDepth.values
          .skip(1)
          .expand((result) => result.exceptions)
          .toList();

  List<ApplicationException> get exceptions =>
      [...onlySuperficialExceptions, ...onlyNestedExceptions];

  List<ApplicationException> get deepestExceptions =>
      _validationOutputsByDepth.entries
          .reduce((acc, other) => acc.key > other.key ? acc : other)
          .value
          .exceptions;

  List<ApplicationError> get onlyNestedErrors =>
      _validationOutputsByDepth.values
          .skip(1)
          .expand((result) => result.errors)
          .toList();

  List<ApplicationError> get errors =>
      [...onlySuperficialErrors, ...onlyNestedErrors];

  List<ApplicationError> get deepestErrors => _validationOutputsByDepth.entries
      .reduce((acc, other) => acc.key > other.key ? acc : other)
      .value
      .errors;

  bool get hasErrors => errors.isNotEmpty;
  bool get hasExceptions => exceptions.isNotEmpty;
  bool get isValid => !hasErrors && !hasExceptions;
  bool get isInvalid => !isValid;
}
