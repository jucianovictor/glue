part of glue_core;

abstract class Repository<DS extends Datasource> {
  DS datasource;
  Repository(this.datasource);
}
