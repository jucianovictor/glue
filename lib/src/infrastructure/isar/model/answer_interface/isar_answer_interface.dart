import 'package:isar/isar.dart';
import 'package:glue_core/glue_core.dart';
import 'package:glue/src/infrastructure/isar/architecture/model/isar_auditable_model.dart';

class IsarAnswerInterface implements IsarAuditableModel {
  @override
  Id? id;

  @override
  DateTime? createdAt;

  @override
  DateTime? updatedAt;

  @Enumerated(EnumType.ordinal)
  AnswerInterfaceType type;

  IsarAnswerInterface({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.type,
  });
}
