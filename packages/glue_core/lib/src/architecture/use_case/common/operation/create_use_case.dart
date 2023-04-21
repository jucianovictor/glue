part of glue_core;

abstract class CreateUseCase<
        ID extends Identifier,
        E extends Entity<ID>,
        SR extends SaveRepository<ID, E, Datasource>,
        I extends UseCaseInput,
        O extends UseCaseOutput>
    with DefaultAsyncErrorsHandler<I, O>
    implements AsyncUseCase<I, O> {
  SR repository;
  CreateUseCase(this.repository);

  E inputToEntity(I input);
  O buildOutput(Identifier identifier);

  Future<O> create(I input, O output) async {
    E entityToSave = inputToEntity(input);
    ValidationOutput validation = validate(entityToSave);

    if (validation.isInvalid) {
      return output
        ..addExceptions(validation.exceptions)
        ..addErrors(validation.errors);
    }

    ID newEntityIdentifier = (await repository.save(entity: entityToSave));
    return buildOutput(newEntityIdentifier);
  }

  ValidationOutput validate(E entity) => entity.validate();
}
