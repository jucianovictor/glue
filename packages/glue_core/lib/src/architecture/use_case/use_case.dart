part of glue_core;

abstract class UseCase<I extends UseCaseInput, O extends UseCaseOutput> {
  execute(I input);
}
