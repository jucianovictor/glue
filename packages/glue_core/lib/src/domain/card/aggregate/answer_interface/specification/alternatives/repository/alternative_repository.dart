part of glue_core;

abstract class AlternativeRepository<Model extends dynamic,
        DS extends Datasource>
    implements GenericEntityRepository<int, IntID, Alternative, Model, DS> {}
