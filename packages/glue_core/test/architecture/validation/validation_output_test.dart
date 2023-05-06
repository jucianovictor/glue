import 'package:glue_core/glue_core.dart';
import 'package:test/test.dart';

import '../../util/mock/generic/validable_object_mock.dart';

void main() {
  late ValidableObjectMock a;
  late ValidableObjectMock b;
  late ValidableObjectMock c;

  group('ValidationOutput', () {
    setUp(() {
      a = ValidableObjectMock();
      b = ValidableObjectMock();
      c = ValidableObjectMock();
    });

    test('should not break when there is cyclic reference', () {
      c
        ..nestedObject = a
        ..willValidateNestedObject();

      b
        ..nestedObject = c
        ..willValidateNestedObject();

      a
        ..nestedObject = b
        ..willValidateNestedObject();

      ValidationOutput shouldBeValidAResult = a.validate();
      ValidationOutput shouldBeValidCResult = c.validate();
      expect(shouldBeValidAResult.isValid, true);
      expect(shouldBeValidCResult.isValid, true);

      b.willTriggerException();

      ValidationOutput shouldBeInvalidAResult = a.validate();
      ValidationOutput shouldBeInvalidCResult = c.validate();
      expect(shouldBeInvalidAResult.isInvalid, true);
      expect(shouldBeInvalidAResult.exceptions.length, 1);
      expect(shouldBeInvalidCResult.isInvalid, true);
      expect(shouldBeInvalidCResult.exceptions.length, 1);
    });

    test('should mark as invalid', () {
      a = ValidableObjectMock();
      a.willTriggerException();

      ValidationOutput outputA = a.validate();

      expect(outputA.isInvalid, true);
    });

    test('should mark as valid', () {
      a = ValidableObjectMock();

      ValidationOutput outputA = a.validate();

      expect(outputA.isValid, true);
    });

    test('should get all errors and exceptions', () {
      a = ValidableObjectMock();
      b = ValidableObjectMock();
      c = ValidableObjectMock();

      c
        ..nestedObject = a
        ..willTriggerException()
        ..willValidateNestedObject();

      b
        ..nestedObject = c
        ..willTriggerError()
        ..willTriggerException()
        ..willValidateNestedObject();

      a
        ..nestedObject = b
        ..willTriggerException()
        ..willValidateNestedObject();

      ValidationOutput outputA = a.validate();

      expect(outputA.isInvalid, true);
      expect(outputA.errors.length, 1);
      expect(outputA.exceptions.length, 3);
    });
  });
}
