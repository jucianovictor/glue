import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:glue/init.dart';
import 'package:glue_core/glue_core.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Isar Block Repository', () {
    late BlockRepository repository;
    Block newBlock =
        Block(value: 'Quanto é 2 + 2', type: BlockType.text, props: {});
    late IntID newBlockId;
    late Block blockFoundById;

    setUpAll(() async {
      await Init.configureDependencies();
      repository = (await GetIt.instance.getAsync<BlockRepository>());
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
