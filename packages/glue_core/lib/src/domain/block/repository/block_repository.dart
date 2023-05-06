part of glue_core;

abstract class BlockRepository<Model extends dynamic, DS extends Datasource>
    implements GenericEntityRepository<int, IntID, Block, Model, DS> {}
