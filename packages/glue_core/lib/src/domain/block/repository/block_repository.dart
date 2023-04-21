part of glue_core;

abstract class BlockRepository<DS extends Datasource>
    extends GenericEntityRepository<IntID, Block, DS> {}
