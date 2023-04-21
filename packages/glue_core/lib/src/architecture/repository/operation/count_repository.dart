part of glue_core;

abstract class CountRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Returns the number of entities.
  Future<int> count();
}
