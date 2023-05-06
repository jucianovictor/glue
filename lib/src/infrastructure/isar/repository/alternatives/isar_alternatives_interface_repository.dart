import 'package:glue/src/infrastructure/isar/architecture/repository/common/generic_isar_repository.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue_core/glue_core.dart';

import '../../model/answer_interface/specifications/isar_alternatives_interface.dart';

class IsarAlternativesInterfaceRepository extends GenericIsarEntityRepository<
        IntID, AlternativesInterface, IsarAlternativesInterface>
    implements
        AlternativesInterfaceRepository<IsarAlternativesInterface,
            IsarDatasource> {
  final AlternativeRepository alternativeRepository;
  IsarAlternativesInterfaceRepository(
      {required IsarDatasource datasource, required this.alternativeRepository})
      : super(datasource);

  @override
  IsarAlternativesInterface entityToModel(AlternativesInterface entity) {
    return IsarAlternativesInterface(
      id: entity.id?.value,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  AlternativesInterface modelToEntity(IsarAlternativesInterface model) {
    return AlternativesInterface(
        alternatives:
            model.alternatives.map(alternativeRepository.modelToEntity).toSet(),
        correctAlternatives:
            model.correctAlternatives.map((a) => IntID(a.id!)).toSet());
  }
}
