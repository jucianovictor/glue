part of glue_core;

abstract class DeleteByIdRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Deletes an entity by your [id]
  Future<void> deleteById(ID id);
}
