part of glue_core;

abstract class CardRepository<DS extends Datasource>
    extends GenericEntityRepository<IntID, Card, DS> {}
