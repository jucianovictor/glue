part of glue_core;

abstract class SaveRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Saves the given entity.
  Future<ID> save({required E entity});
}
