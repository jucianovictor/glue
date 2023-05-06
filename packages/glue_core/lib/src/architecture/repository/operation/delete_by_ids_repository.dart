part of glue_core;

abstract class DeleteByIdsRepository<
    ID extends Identifier,
    E extends Entity<ID>,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  /// Deletes entities by [ids]
  Future<void> deleteByIds(List<ID> ids);
}
