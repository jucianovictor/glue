import 'package:glue/src/infrastructure/isar/architecture/repository/common/generic_isar_repository.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue_core/glue_core.dart';

import '../../model/answer_interface/specifications/isar_alternative.dart';

class IsarAlternativeRepository
    extends GenericIsarEntityRepository<IntID, Alternative, IsarAlternative>
    implements AlternativeRepository<IsarAlternative, IsarDatasource> {
  IsarAlternativeRepository({required IsarDatasource datasource})
      : super(datasource);

  @override
  IsarAlternative entityToModel(Alternative entity) {
    return IsarAlternative(
      id: entity.id?.value,
      description: entity.value,
    );
  }

  @override
  Alternative modelToEntity(IsarAlternative model) {
    return Alternative(
      id: model.id != null ? IntID(model.id!) : null,
      value: model.description,
    );
  }
}
