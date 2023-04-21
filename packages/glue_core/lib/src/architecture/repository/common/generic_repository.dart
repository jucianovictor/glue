part of glue_core;

abstract class GenericEntityRepository<ID extends Identifier,
        E extends Entity<ID>, DS extends Datasource>
    implements
        SaveRepository<ID, E, DS>,
        FindByIdRepository<ID, E, DS>,
        FindAllRepository<ID, E, DS>,
        FindByIdsRepository<ID, E, DS>,
        DeleteByIdRepository<ID, E, DS>,
        CountRepository<ID, E, DS> {}
