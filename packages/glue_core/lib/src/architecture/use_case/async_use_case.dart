part of glue_core;

abstract class AsyncUseCase<I extends UseCaseInput, O extends UseCaseOutput>
    extends UseCase<I, O> {
  @override
  Future<O> execute(I input);
}
