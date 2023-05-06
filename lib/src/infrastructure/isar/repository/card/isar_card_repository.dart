import 'package:glue/src/infrastructure/isar/architecture/repository/common/generic_isar_repository.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue/src/infrastructure/isar/repository/alternatives/isar_alternatives_interface_repository.dart';
import 'package:glue_core/glue_core.dart';

import '../../model/answer_interface/specifications/isar_alternatives_interface.dart';
import '../../model/card/isar_card.dart';
import '../block/isar_block_repository.dart';

class IsarCardRepository
    extends GenericIsarEntityRepository<IntID, Card, IsarCard>
    implements CardRepository<IsarCard, IsarDatasource> {
  final IsarAlternativesInterfaceRepository isarAlternativesInterfaceRepository;
  final IsarBlockRepository isarBlockRepository;

  IsarCardRepository(
      {required IsarDatasource datasource,
      required this.isarAlternativesInterfaceRepository,
      required this.isarBlockRepository})
      : super(datasource);

  @override
  IsarCard entityToModel(Card entity) {
    if (entity.answer is! AlternativesInterface) {
      throw UnimplementedError('Only AlternativesInterface is implemented');
    }

    IsarAlternativesInterface alternativesInterfaceModel =
        isarAlternativesInterfaceRepository
            .entityToModel(entity.answer as AlternativesInterface);

    return IsarCard(
      id: entity.id?.value,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    )..alternativesInterface.value = alternativesInterfaceModel;
  }

  @override
  Card modelToEntity(IsarCard model) {
    model.alternativesInterface.load();
    model.blocks.load();

    if (model.alternativesInterface.value == null) {
      throw UnimplementedError('Only AlternativesInterface is implemented');
    }
    AlternativesInterface alternativesInterface =
        isarAlternativesInterfaceRepository
            .modelToEntity(model.alternativesInterface.value!);

    return Card(
        answer: alternativesInterface,
        sentence: DynamicContent(
            blocks:
                model.blocks.map(isarBlockRepository.modelToEntity).toList()));
  }
}
