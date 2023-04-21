import 'package:glue/src/infrastructure/isar/architecture/model/isar_auditable_model.dart';
import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';

@collection
@Name('AnswerForm')
class IsarAnswerForm implements IsarAuditableModel {
  @override
  Id? id;

  @override
  DateTime createdAt;

  @override
  DateTime? updatedAt;

  @Enumerated(EnumType.ordinal)
  AnswerFormType type;

  IsarAnswerForm({
    this.id,
    DateTime? createdAt,
    this.updatedAt,
    required this.type,
  }) : createdAt = createdAt ?? DateTime.now();
}
