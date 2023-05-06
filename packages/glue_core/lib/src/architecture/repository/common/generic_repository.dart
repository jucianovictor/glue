part of glue_core;

abstract class GenericEntityRepository<
        TID extends dynamic,
        ID extends Identifier<TID>,
        E extends Entity<ID>,
        Model extends dynamic,
        DS extends Datasource>
    implements
        SaveRepository<ID, E, DS>,
        CountRepository<ID, E, DS>,
        SaveAllRepository<ID, E, DS>,
        FindAllRepository<ID, E, DS>,
        FindByIdRepository<ID, E, DS>,
        FindByIdsRepository<ID, E, DS>,
        DeleteByIdRepository<ID, E, DS>,
        DeleteByIdsRepository<ID, E, DS>,
        EntityModelRepository<TID, ID, E, Model, DS> {}
