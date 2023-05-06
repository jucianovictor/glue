part of glue_core;

abstract class FindByIdRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Returns the entity by your [id].
  Future<E> findById(ID id);
}
