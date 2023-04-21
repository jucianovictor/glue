part of glue_core;

abstract class Datasource {
  /// Should return the Datasource type,
  /// like: `Database`, `File`, `Memory`, `Cache`, `API Server`, etc...
  String get type;

  Datasource({DatasourceConnection? properties});
}
