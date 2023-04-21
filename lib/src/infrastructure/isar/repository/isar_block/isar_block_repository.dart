import 'package:glue/src/infrastructure/isar/architecture/repository/common/generic_isar_repository.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue/src/infrastructure/utils/converters/map_converter.dart';
import 'package:glue_core/glue_core.dart';

import '../../model/block/isar_block.dart';

class IsarBlockRepository
    extends GenericIsarEntityRepository<IntID, Block, IsarBlock>
    implements BlockRepository<IsarDatasource> {
  IsarBlockRepository({required IsarDatasource datasource}) : super(datasource);

  @override
  IsarBlock entityToModel(Block entity) {
    IsarBlock model = IsarBlock(
      id: entity.id?.value,
      value: entity.value,
      type: entity.type,
      jsonProps: MapConverter.toJson(entity.props),
    );
    return model;
  }

  @override
  Block modelToEntity(IsarBlock model) {
    return Block(
        id: model.id != null ? IntID(model.id!) : null,
        value: model.value,
        type: model.type,
        props: MapConverter.fromJson(model.jsonProps)
            .map((key, value) => MapEntry(key.toString(), value.toString())));
  }
}
