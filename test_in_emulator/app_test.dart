import 'package:flutter_test/flutter_test.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource_connection.dart';
import 'package:glue/src/infrastructure/isar/repository/isar_block/isar_block_repository.dart';
import 'package:glue_core/glue_core.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Isar Block Repository', () {
    late IsarDatasourceConnection connection;
    late IsarDatasource datasource;
    late BlockRepository repository;
    Block newBlock =
        Block(value: 'Quanto é 2 + 2', type: BlockType.text, props: {});
    late Identifier newBlockId;
    late Block blockFoundById;

    setUpAll(() async {
      connection =
          await IsarDatasourceConnection.getTemporaryDatabaseConnection();
      datasource = IsarDatasource(connection: connection);
      repository = IsarBlockRepository(datasource: datasource);
    });

    test('should save block', () async {
      newBlockId = await repository.save(entity: newBlock);
      expect(newBlockId, isNotNull);
    });

    test('should find block', () async {
      blockFoundById = await repository.findById(newBlockId);
      expect(blockFoundById, isNotNull);
      expect(blockFoundById.id!.value, equals(newBlockId.value));
    });

    test('should update block', () async {
      Block updatedBlock = blockFoundById..value = 'Quanto é 4 + 4?';
      Identifier id = await repository.save(entity: updatedBlock);
      expect(id, isNotNull);
      expect(id.value, equals(newBlockId.value));
    });

    test('should remove block by id', () async {
      await repository.deleteById(newBlockId);
      int count = await repository.count();
      expect(count, equals(0));
    });
  });
}
