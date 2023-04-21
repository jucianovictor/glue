import 'isar_model.dart';

abstract class IsarAuditableModel extends IsarModel {
  DateTime createdAt;
  DateTime? updatedAt;

  IsarAuditableModel({
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = DateTime.now();
}
