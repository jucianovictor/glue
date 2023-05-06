import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:glue/init.dart';
import 'package:glue_core/glue_core.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Isar AlternativesInterface Repository', () {
    late AlternativesInterfaceRepository repository;
    late AlternativeRepository alternativeRepository;

    late IntID newAlternativesInterfaceId;
    late AlternativesInterface alternativesInterfaceFoundById;
    late Set<Alternative> alternatives;
    late Set<Identifier> correctAlternatives;

    setUpAll(() async {
      await Init.configureDependencies();
      repository =
          (await GetIt.instance.getAsync<AlternativesInterfaceRepository>());
      alternativeRepository =
          (await GetIt.instance.getAsync<AlternativeRepository>());

      List<IntID> ids = (await alternativeRepository.saveAll(entities: [
        Alternative(value: '2'),
        Alternative(value: '4'),
        Alternative(value: '6'),
        Alternative(value: '8')
      ]));

      alternatives = (await alternativeRepository.findByIds(ids)).toSet();
      correctAlternatives =
          alternatives.where((a) => a.value == '4').map((a) => a.id!).toSet();

      Logger.warning(await repository.count());
      Logger.warning(await alternativeRepository.count());
    });

    tearDownAll(() => {
          alternativeRepository
              .deleteByIds(alternatives.map((a) => a.id!).toList())
        });

    test('should save alternatives interface', () async {
      AlternativesInterface newAlternativesInterface = AlternativesInterface(
          alternatives: alternatives, correctAlternatives: correctAlternatives);
      newAlternativesInterfaceId =
          await repository.save(entity: newAlternativesInterface);
      expect(newAlternativesInterfaceId, isNotNull);
    });

    test('should find alternativesInterface', () async {
      alternativesInterfaceFoundById =
          await repository.findById(newAlternativesInterfaceId);
      expect(alternativesInterfaceFoundById, isNotNull);
      expect(alternativesInterfaceFoundById.id!.value,
          equals(newAlternativesInterfaceId.value));
    });

    test('should update alternativesInterface', () async {
      AlternativesInterface updatedAlternativesInterface =
          alternativesInterfaceFoundById
            ..correctAlternatives = alternatives
                .where((a) => a.value == '6')
                .map((a) => a.id!)
                .toSet();

      Identifier id =
          await repository.save(entity: updatedAlternativesInterface);
      expect(id, isNotNull);
      expect(id.value, equals(newAlternativesInterfaceId.value));
    });

    test('should remove alternativesInterface by id', () async {
      await repository.deleteById(newAlternativesInterfaceId);
      int count = await repository.count();
      int countAlternatives = await alternativeRepository.count();
      expect(count, equals(0));
      expect(countAlternatives, equals(0));
    });
  });
}
