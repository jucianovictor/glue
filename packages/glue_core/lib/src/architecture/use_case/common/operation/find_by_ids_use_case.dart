part of glue_core;

abstract class FindByIdsUseCase<
        ID extends Identifier,
        E extends Entity<ID>,
        SR extends FindByIdsRepository<ID, E, Datasource>,
        I extends UseCaseInput,
        O extends UseCaseOutput>
    with DefaultAsyncErrorsHandler<I, O>
    implements AsyncUseCase<I, O> {
  SR repository;
  FindByIdsUseCase(this.repository);

  ValidationOutput indentifierValidation(ID id) => id.validate();

  O buildOutput(List<E> foundedEntities, O output);

  List<ID> inputToIdentifiers(I input);

  Future<O> findByIds(I input, O output) async {
    List<ID> identifiers = inputToIdentifiers(input);
    identifiers
        .map(indentifierValidation)
        .where((validation) => validation.isInvalid)
        .forEach((validation) {
      output.addErrors(validation.errors);
      output.addExceptions(validation.exceptions);
    });

    List<E> entitiesFound = (await repository.findByIds(identifiers));

    return buildOutput(entitiesFound, output);
  }
}
