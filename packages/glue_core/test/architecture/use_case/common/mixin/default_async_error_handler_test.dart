import 'package:glue_core/glue_core.dart';
import 'package:test/test.dart';

class TestOutput extends UseCaseOutput {
  TestOutput() : super();
}

class TestInput extends UseCaseInput {
  TestInput() : super();
}

class UseCaseTest extends UseCase<TestInput, TestOutput>
    with DefaultAsyncErrorsHandler<TestInput, TestOutput> {
  UseCaseTest() : super();

  Future<TestOutput> throwError(TestInput input, TestOutput output) async {
    throw ApplicationError(message: 'Test');
  }

  @override
  Future<TestOutput> execute(TestInput input) async {
    return handleErrors(throwError, input, TestOutput());
  }
}

void main() {
  //setUp(setupTest);
  test('Errors must not interrupt use case execution', () async {
    UseCaseTest useCase = UseCaseTest();
    TestOutput output = (await useCase.execute(TestInput()));

    expect(output.isInvalid, true);
  });
}
