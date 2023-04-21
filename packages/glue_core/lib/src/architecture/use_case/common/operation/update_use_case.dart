part of glue_core;

abstract class UpdateUseCase<
        ID extends Identifier,
        E extends Entity<ID>,
        SR extends SaveRepository<ID, E, Datasource>,
        I extends UseCaseInput,
        O extends UseCaseOutput>
    with DefaultAsyncErrorsHandler<I, O>
    implements AsyncUseCase<I, O> {
  SR repository;
  UpdateUseCase(this.repository);

  E inputToEntity(I input);
  O buildOutput(Identifier identifier);
  ValidationOutput validate(E entity) => entity.validate();

  Future<O> update(I input, O output) async {
    E entityToUpdate = inputToEntity(input);
    ValidationOutput validation = validate(entityToUpdate);

    if (validation.isInvalid) {
      return output
        ..addExceptions(validation.exceptions)
        ..addErrors(validation.errors);
    }

    ID id = (await repository.save(entity: entityToUpdate));
    return buildOutput(id);
  }
}
