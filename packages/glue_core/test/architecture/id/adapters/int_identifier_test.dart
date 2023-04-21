import 'package:glue_core/glue_core.dart';
import 'package:test/test.dart';

void main() {
  test('should create a int id', () {
    Identifier id = IntID(1);

    expect(id.value, 1);
  });
}
