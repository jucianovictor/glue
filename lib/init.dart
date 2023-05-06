import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:glue/src/infrastructure/isar/architecture/connection/isar_datasource_connection.dart';
import 'package:glue/src/infrastructure/isar/connections/isar_datasource_prod_connection.dart';
import 'package:glue/src/infrastructure/isar/connections/isar_datasource_test_connection.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue/src/infrastructure/isar/repository/alternatives/isar_alternative_repository.dart';
import 'package:glue/src/infrastructure/isar/repository/alternatives/isar_alternatives_interface_repository.dart';
import 'package:glue/src/infrastructure/isar/repository/block/isar_block_repository.dart';
import 'package:glue_core/glue_core.dart';

class Init {
  static final getIt = GetIt.instance;
  static final env = dotenv.env;

  static Future<void> configureDependencies() async {
    await dotenv.load(fileName: '.env');
    final getIt = GetIt.instance;

    // Connections
    getIt.registerLazySingletonAsync<IsarDatasourceProdConnection>(
        () => IsarDatasourceProdConnection.getConnection());
    getIt.registerLazySingletonAsync<IsarDatasourceTestConnection>(
        () => IsarDatasourceTestConnection.getConnection());

    // Connection by environment
    getIt.registerLazySingletonAsync<IsarDatasourceConnection>(() async =>
        env['ENV'] == 'test'
            ? await getIt.getAsync<IsarDatasourceTestConnection>()
            : await getIt.getAsync<IsarDatasourceProdConnection>());

    // Datasource
    getIt.registerLazySingletonAsync<IsarDatasource>(() async => IsarDatasource(
        connection: await getIt.getAsync<IsarDatasourceConnection>()));

    // Repositories
    getIt.registerLazySingletonAsync<BlockRepository>(() async =>
        IsarBlockRepository(
            datasource: await getIt.getAsync<IsarDatasource>()));

    getIt.registerLazySingletonAsync<AlternativeRepository>(() async =>
        IsarAlternativeRepository(
            datasource: await getIt.getAsync<IsarDatasource>()));

    getIt.registerLazySingletonAsync<AlternativesInterfaceRepository>(
        () async => IsarAlternativesInterfaceRepository(
            datasource: await getIt.getAsync<IsarDatasource>(),
            alternativeRepository:
                await getIt.getAsync<AlternativeRepository>()));

    await getIt.allReady();
  }
}
