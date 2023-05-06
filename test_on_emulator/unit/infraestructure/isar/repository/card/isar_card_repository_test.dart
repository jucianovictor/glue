import 'package:glue/src/infrastructure/isar/connections/isar_datasource_test_connection.dart';
import 'package:glue/src/infrastructure/isar/repository/card/isar_card_repository.dart';
import 'package:glue_core/glue_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue/src/infrastructure/isar/architecture/connection/isar_datasource_connection.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Isar Card Repository', () {
    late IsarDatasourceConnection connection;
    late IsarDatasource datasource;
    late CardRepository repository;

    Set<Alternative> alternatives = {
      Alternative(value: '4'),
      Alternative(value: '5'),
      Alternative(value: '6'),
      Alternative(value: '7'),
    };

    DynamicContent sentence = DynamicContent(blocks: [
      Block(value: 'Quanto é 2 + 2', type: BlockType.text, props: {}),
    ]);

    late AnswerInterface answerInterface;
    late Identifier newCardId;
    late Card blockFoundById;

    setUpAll(() async {
      connection = await IsarDatasourceTestConnection.getConnection();
      datasource = IsarDatasource(connection: connection);
      repository = IsarCardRepository(datasource: datasource);
    });

    test('should save block', () async {
      newCardId = await repository.save(entity: newCard);
      expect(newCardId, isNotNull);
    });

    test('should find block', () async {
      blockFoundById = await repository.findById(newCardId);
      expect(blockFoundById, isNotNull);
      expect(blockFoundById.id!.value, equals(newCardId.value));
    });

    test('should update block', () async {
      Card updatedCard = blockFoundById..value = 'Quanto é 4 + 4?';
      Identifier id = await repository.save(entity: updatedCard);
      expect(id, isNotNull);
      expect(id.value, equals(newCardId.value));
    });

    test('should remove block by id', () async {
      await repository.deleteById(newCardId);
      int count = await repository.count();
      expect(count, equals(0));
    });
  });
}
