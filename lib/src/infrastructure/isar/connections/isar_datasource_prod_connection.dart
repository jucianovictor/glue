import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../architecture/connection/isar_datasource_connection.dart';

class IsarDatasourceProdConnection implements IsarDatasourceConnection {
  static const String prodDbName = 'glue_database';
  static const List<CollectionSchema<dynamic>> prodSchemas =
      IsarDatasourceConnection.defaultSchemas;

  @override
  Isar isar;

  IsarDatasourceProdConnection._(this.isar);

  static Future<IsarDatasourceProdConnection> getConnection() async {
    String path =
        '${(await getApplicationDocumentsDirectory()).path}/$prodDbName';

    Isar isar = await Isar.open(prodSchemas, directory: path).then((value) {
      Logger.info(
          'Connection with embedded database has been created in $path');
      return value;
    }, onError: (error) {
      Logger.error('Can not open database connection with $path', error);
    });

    return IsarDatasourceProdConnection._(isar);
  }
}
