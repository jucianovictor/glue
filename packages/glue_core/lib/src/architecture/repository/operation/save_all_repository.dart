part of glue_core;

abstract class SaveAllRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Saves the given entity.
  Future<List<ID>> saveAll({required List<E> entities});
}
