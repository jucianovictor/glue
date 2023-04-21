part of glue_core;

abstract class SyncUseCase<I extends UseCaseInput, O extends UseCaseOutput>
    extends UseCase<I, O> {
  @override
  O execute(I input);
}
