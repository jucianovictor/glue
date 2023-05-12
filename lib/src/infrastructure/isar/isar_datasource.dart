import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';
import 'package:glue/src/infrastructure/isar/architecture/connection/isar_datasource_connection.dart';
import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';

class IsarDatasource implements Datasource {
  final IsarDatasourceConnection _connection;

  IsarDatasource({required IsarDatasourceConnection connection})
      : _connection = connection;

  IsarCollection<M> getCollection<M extends IsarModel>() {
    IsarCollection<M> collection = _connection.isar.collection<M>();
    return collection;
  }

  Future<T> asyncReadAndWriteTransaction<T>(
      Future<T> Function() callback) async {
    Logger.info('Start transaction');
    return (await _connection.isar.writeTxn(callback).then((value) {
      Logger.info('Commit transaction');
      return value;
    }, onError: (error) {
      Logger.error('Rollback transaction', error);
    }));
  }

  Future<T> asyncReadTransaction<T>(Future<T> Function() callback) async {
    Logger.info('Start transaction');
    return (await _connection.isar.txn(callback).then((value) {
      Logger.info('Commit transaction');
      return value;
    }, onError: (error) {
      Logger.error('Rollback transaction', error);
    }));
  }

  T syncReadAndWriteTransaction<T>(T Function() callback) {
    return _connection.isar.writeTxnSync(() {
      Logger.info('Start transaction');
      T output = callback();
      Logger.info('Commit transaction');
      return output;
    });
  }

  @override
  String get type => 'Embedded Database';
}
