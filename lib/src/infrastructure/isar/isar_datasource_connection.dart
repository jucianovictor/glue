import 'package:glue/src/infrastructure/isar/model/block/isar_block.dart';
import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasourceConnection implements DatasourceConnection {
  late final Isar isar;

  static const String dbName = 'glue_database';
  static const String testDbName = 'test_glue_database';
  static const List<CollectionSchema<dynamic>> schemas = [IsarBlockSchema];

  IsarDatasourceConnection._(this.isar);

  static getNewDatabaseConnection() async {
    String path = '${(await getApplicationDocumentsDirectory()).path}/$dbName';

    Isar isar = await Isar.open(schemas, directory: path).then((value) {
      Logger.info(
          'Connection with embedded database has been created in $path');
      return value;
    }, onError: (error) {
      Logger.error('Can not open database connection with $path', error);
    });

    return IsarDatasourceConnection._(isar);
  }

  static getTemporaryDatabaseConnection() async {
    String path = (await getTemporaryDirectory()).path;
    Isar isar =
        await Isar.open(schemas, directory: path, name: dbName).then((value) {
      Logger.info(
          'Connection with embedded database has been created in ${value.directory}');
      return value;
    }, onError: (error) {
      Logger.error('Can not open database connection', error);
    });

    return IsarDatasourceConnection._(isar);
  }
}
