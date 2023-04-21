part of glue_core;

abstract class FindByIdsRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Returns all entities by your identifiers.
  Future<List<E>> findByIds(List<ID> identifiers);
}
