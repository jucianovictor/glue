part of glue_core;

abstract class AlternativesInterfaceRepository<Model extends dynamic,
        DS extends Datasource>
    implements
        GenericEntityRepository<int, IntID, AlternativesInterface, Model, DS> {}
