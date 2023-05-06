import 'package:glue/src/infrastructure/isar/model/answer_interface/specifications/isar_alternative.dart';
import 'package:isar/isar.dart';

import 'package:glue_core/glue_core.dart';

import '../../model/answer_interface/specifications/isar_alternatives_interface.dart';
import '../../model/block/isar_block.dart';

abstract class IsarDatasourceConnection extends DatasourceConnection {
  late final Isar isar;
  static const List<CollectionSchema<dynamic>> defaultSchemas = [
    IsarBlockSchema,
    IsarAlternativeSchema,
    IsarAlternativesInterfaceSchema,
  ];
}
