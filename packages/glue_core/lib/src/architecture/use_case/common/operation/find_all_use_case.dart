part of glue_core;

abstract class FindAllUseCase<
        ID extends Identifier,
        E extends Entity<ID>,
        SR extends FindAllRepository<ID, E, Datasource>,
        I extends UseCaseInput,
        O extends UseCaseOutput>
    with DefaultAsyncErrorsHandler<I, O>
    implements AsyncUseCase<I, O> {
  SR repository;
  FindAllUseCase(this.repository);

  O buildOutput(List<E> foundedEntities, O output);

  Future<O> findAll(I input, O output) async {
    List<E>? foundedEntities = (await repository.findAll());

    if (foundedEntities == null || foundedEntities.isEmpty)
      throw NoEntityFoundDomainException();

    if (foundedEntities.any(_isInvalidFoundEntity))
      throw EntityImplementationError.theseEntities(
        entities: foundedEntities.where(_isInvalidFoundEntity).toList(),
      );

    return buildOutput(foundedEntities, output);
  }

  bool _isInvalidFoundEntity(entity) =>
      entity.id == null || entity.createdAt == null;
}
