part of glue_core;

abstract class FindAllRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Returns all entities.
  Future<List<E>?> findAll();
}
