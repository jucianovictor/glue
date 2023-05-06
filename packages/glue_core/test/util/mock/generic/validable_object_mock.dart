import 'package:glue_core/glue_core.dart';

class ValidableObjectMock implements Validable {
  Validable? nestedObject;
  List<Validable?>? nestedObjects;
  bool? shouldTriggerError;
  bool? shouldTriggerException;
  bool? shouldValidateNestedObject;
  bool? shouldValidateNestedObjects;

  void willTriggerError() => shouldTriggerError = true;
  void willTriggerException() => shouldTriggerException = true;
  void willValidateNestedObject() => shouldValidateNestedObject = true;
  void willValidateNestedObjects() => shouldValidateNestedObjects = true;

  @override
  ValidationOutput validate({ValidationInput? input}) =>
      ValidationOutput(object: this, input: input)
        ..addErrorIf(shouldTriggerError != null && shouldTriggerError!,
            ApplicationError(message: 'test error'))
        ..addExceptionIf(
            shouldTriggerException != null && shouldTriggerException!,
            ApplicationException(message: 'test exception'))
        ..validateNestedObjectIf(
            shouldValidateNestedObject != null && shouldValidateNestedObject!,
            nestedObject)
        ..validateNestedObjectsIf(
            shouldValidateNestedObjects != null && shouldValidateNestedObjects!,
            nestedObjects);
}
