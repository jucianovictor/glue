import 'package:glue_core/glue_core.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('should generate a valid uuid', () {
    Identifier<String> id = UUID();
    expect(Uuid.isValidUUID(fromString: id.value), true);
  });

  test('should create from a valid uuid', () {
    String validUUID = const Uuid().v1();
    Identifier id = UUID(validUUID);
    expect(id.value, validUUID);
  });

  test('should throw ApplicationError', () {
    ValidationOutput vo = UUID('invalid-uuid').validate();
    expect(vo.onlySuperficialErrors[0], isA<ApplicationError>());
  });
}
