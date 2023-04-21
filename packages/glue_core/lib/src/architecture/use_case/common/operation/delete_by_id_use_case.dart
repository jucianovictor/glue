part of glue_core;

abstract class DeleteByIdUseCase<
        ID extends Identifier,
        E extends Entity<ID>,
        SR extends DeleteByIdRepository<ID, E, Datasource>,
        I extends UseCaseInput,
        O extends UseCaseOutput>
    with DefaultAsyncErrorsHandler<I, O>
    implements AsyncUseCase<I, O> {
  SR repository;
  DeleteByIdUseCase(this.repository);

  ValidationOutput identifierValidation(ID id) => id.validate();
  ID extractIdentifierFromInput(I input);

  Future<O> deleteById(I input, O output) async {
    ID id = extractIdentifierFromInput(input);

    ValidationOutput validation = identifierValidation(id);

    if (validation.isInvalid) {
      return output
        ..addExceptions(validation.exceptions)
        ..addErrors(validation.errors);
    }

    await repository.deleteById(id);
    return output;
  }
}
