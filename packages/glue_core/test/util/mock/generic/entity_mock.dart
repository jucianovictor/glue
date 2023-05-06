import 'package:glue_core/glue_core.dart';

import 'validable_object_mock.dart';

class EntityMock extends ValidableObjectMock implements Entity<Identifier> {
  @override
  Identifier? id;

  @override
  DateTime? createdAt;

  @override
  DateTime? updatedAt;

  EntityMock({this.id, this.createdAt, this.updatedAt});

  @override
  ValidationOutput validate({ValidationInput? input}) =>
      ValidationOutput(object: this, input: input)
        ..validateAsEntity()
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

  @override
  String toString() {
    return 'EntityMock: {id: $id, createdAt: $createdAt, updateAt: $updatedAt}';
  }
}
