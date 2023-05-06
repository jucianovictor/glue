import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:glue/init.dart';
import 'package:glue_core/glue_core.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Isar alternative Repository', () {
    late AlternativeRepository alternativeRepository;
    Alternative newAlternative = Alternative(value: '4');
    late IntID newAlternativeId;
    late Alternative alternativeFoundById;

    setUpAll(() async {
      await Init.configureDependencies();
      alternativeRepository =
          (await GetIt.instance.getAsync<AlternativeRepository>());
    });

    test('should save alternative', () async {
      newAlternativeId =
          await alternativeRepository.save(entity: newAlternative);
      expect(newAlternativeId, isNotNull);
    });

    test('should find alternative', () async {
      alternativeFoundById =
          await alternativeRepository.findById(newAlternativeId);
      expect(alternativeFoundById, isNotNull);
      expect(alternativeFoundById.id!.value, equals(newAlternativeId.value));
    });

    test('should update alternative', () async {
      Alternative updatedAlternative = alternativeFoundById..value = '5';
      Identifier id =
          await alternativeRepository.save(entity: updatedAlternative);
      expect(id, isNotNull);
      expect(id.value, equals(newAlternativeId.value));
    });

    test('should remove alternative by id', () async {
      await alternativeRepository.deleteById(newAlternativeId);
      int count = await alternativeRepository.count();
      expect(count, equals(0));
    });
  });
}
