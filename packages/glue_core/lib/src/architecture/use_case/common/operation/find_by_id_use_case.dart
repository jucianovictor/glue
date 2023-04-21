part of glue_core;

abstract class FindByIdUseCase<
        ID extends Identifier,
        E extends Entity<ID>,
        SR extends FindByIdRepository<ID, E, Datasource>,
        I extends UseCaseInput,
        O extends UseCaseOutput>
    with DefaultAsyncErrorsHandler<I, O>
    implements AsyncUseCase<I, O> {
  SR repository;
  FindByIdUseCase(this.repository);

  O buildOutput(E entity);
  ValidationOutput identifierValidation(ID id) => id.validate();
  ID extractIdentifierFromInput(I input);

  Future<O> findById(I input, O output) async {
    ID id = extractIdentifierFromInput(input);
    ValidationOutput validation = identifierValidation(id);

    if (validation.isInvalid) {
      return output
        ..addErrors(validation.errors)
        ..addExceptions(validation.exceptions);
    }

    E persistedEntity = (await repository.findById(id));
    return buildOutput(persistedEntity);
  }
}
