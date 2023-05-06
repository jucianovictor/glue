import 'package:isar/isar.dart';
import 'package:glue/src/infrastructure/isar/model/block/isar_block.dart';
import 'package:glue/src/infrastructure/isar/architecture/model/isar_auditable_model.dart';

import '../answer_interface/specifications/isar_alternatives_interface.dart';

part 'isar_card.g.dart';

@collection
@Name('Card')
class IsarCard implements IsarAuditableModel {
  @override
  Id? id;

  @override
  DateTime? createdAt;

  @override
  DateTime? updatedAt;

  final blocks = IsarLinks<IsarBlock>();

  // answerInterfaces:
  final alternativesInterface = IsarLink<IsarAlternativesInterface>();
  //final openInterface = IsarLink<IsarOpen?>();

  IsarCard({
    this.id,
    this.createdAt,
    this.updatedAt,
  });
}
