import 'package:glue/src/infrastructure/isar/architecture/repository/common/generic_isar_repository.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue/src/infrastructure/isar/model/answer_interface/specifications/isar_alternative.dart';
import 'package:glue_core/glue_core.dart';

import '../../model/answer_interface/specifications/isar_alternatives_interface.dart';

class IsarAlternativesInterfaceRepository extends GenericIsarEntityRepository<
        IntID, AlternativesInterface, IsarAlternativesInterface>
    implements
        AlternativesInterfaceRepository<IsarAlternativesInterface,
            IsarDatasource> {
  final AlternativeRepository alternativeRepository;
  final BlockRepository blockRepository;

  IsarAlternativesInterfaceRepository(
      {required IsarDatasource datasource,
      required this.alternativeRepository,
      required this.blockRepository})
      : super(datasource);

  @override
  Future<IntID> save({required AlternativesInterface entity}) async {
    int id = datasource.syncReadAndWriteTransaction<int>(
        () => collection.putSync(entityToModel(entity)));
    return toIdentifier(id);
  }

  @override
  IsarAlternativesInterface entityToModel(AlternativesInterface entity) {
    List<IsarAlternative> isarAlternatives = entity.alternatives
        .map<IsarAlternative>((a) => alternativeRepository.entityToModel(a))
        .toList();
    IsarAlternativesInterface isarAlternativesInterface =
        IsarAlternativesInterface(
      id: entity.id?.value,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    )
          ..alternatives.addAll(isarAlternatives)
          ..correctAlternatives.addAll(entity.alternatives
              .where((a) => entity.correctAlternatives.contains(a.id!))
              .map((e) => alternativeRepository.entityToModel(e)));

    return isarAlternativesInterface;
  }

  @override
  AlternativesInterface modelToEntity(IsarAlternativesInterface model) {
    model.alternatives.loadSync();
    model.correctAlternatives.loadSync();

    return AlternativesInterface(
        id: toIdentifier(model.id!),
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        explanation: DynamicContent(
            blocks: model.explanation
                .map((e) => blockRepository.modelToEntity(e))
                .toList()),
        alternatives:
            model.alternatives.map(alternativeRepository.modelToEntity).toSet(),
        correctAlternatives:
            model.correctAlternatives.map((a) => IntID(a.id!)).toSet());
  }
}
