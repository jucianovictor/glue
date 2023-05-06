import 'package:glue/src/infrastructure/isar/architecture/connection/isar_datasource_connection.dart';
import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasourceTestConnection implements IsarDatasourceConnection {
  static const String testDbName = 'test_glue_database';
  static const List<CollectionSchema<dynamic>> testSchemas =
      IsarDatasourceConnection.defaultSchemas;

  @override
  Isar isar;

  IsarDatasourceTestConnection._(this.isar);

  static Future<IsarDatasourceTestConnection> getConnection() async {
    String path = (await getTemporaryDirectory()).path;
    Isar isar = await Isar.open(testSchemas, directory: path, name: testDbName)
        .then((value) {
      Logger.info(
          'Connection with embedded test database has been created in ${value.directory}');
      return value;
    }, onError: (error) {
      Logger.error('Can not open database connection', error);
    });

    return IsarDatasourceTestConnection._(isar);
  }
}
