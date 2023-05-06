part of glue_core;

abstract class CardRepository<Model extends dynamic, DS extends Datasource>
    implements GenericEntityRepository<int, IntID, Card, Model, DS> {}
