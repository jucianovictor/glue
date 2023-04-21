part of glue_core;

abstract class EntityRepository<ID extends Identifier, E extends Entity<ID>,
    DS extends Datasource> implements Repository<DS> {}
