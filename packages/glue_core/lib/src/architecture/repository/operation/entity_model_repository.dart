part of glue_core;

abstract class EntityModelRepository<
    TID extends dynamic,
    ID extends Identifier<TID>,
    E extends Entity<ID>,
    M extends dynamic,
    DS extends Datasource> implements EntityRepository<ID, E, DS> {
  M entityToModel(E entity);
  E modelToEntity(M model);
  TID fromIdentifier(ID id);
  ID toIdentifier(TID id);
}
