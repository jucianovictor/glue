import 'package:glue_core/glue_core.dart';
import 'package:test/test.dart';

import '../../util/test-setup.dart';

class TestInput extends UseCaseInput {}

class TestOutput extends UseCaseOutput {}

class ThrowErrorUseCase
    with DefaultAsyncErrorsHandler<TestInput, TestOutput>
    implements AsyncUseCase<TestInput, TestOutput> {
  Future<TestOutput> throwError(TestInput input, TestOutput output) async {
    throw Error();
  }

  @override
  Future<TestOutput> execute(TestInput input) async =>
      handleErrors(throwError, input, TestOutput());
}

void main() {
  setUp(setupTest);

  test('Errors must not interrupt use case execution', () async {
    TestOutput output = (await ThrowErrorUseCase().execute(TestInput()));

    //expect(ThrowErrorUseCase().execute(TestInput()), completes);
    expect(output.isInvalid, isTrue);
    expect((output.applicationErrors[0] as UnexpectedError).originalObject,
        isA<Error>());
  });
}
