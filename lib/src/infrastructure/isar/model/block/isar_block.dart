import 'package:isar/isar.dart';

import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';
import 'package:glue_core/glue_core.dart';

part 'isar_block.g.dart';

@collection
@Name('block')
class IsarBlock implements IsarModel {
  @override
  Id? id;

  String value;

  String jsonProps;

  @Enumerated(EnumType.ordinal)
  BlockType type;

  IsarBlock({
    this.id,
    required this.value,
    required this.jsonProps,
    required this.type,
  });
}
