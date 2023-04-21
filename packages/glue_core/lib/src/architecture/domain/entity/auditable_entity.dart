part of glue_core;

abstract class AuditableEntity<ID extends Identifier> extends Entity<ID> {
  DateTime? updatedAt;
  DateTime? createdAt;

  AuditableEntity(super.id);

  @override
  String toString() => '{id: $id, createdAt: $createdAt, updateAt: $updatedAt}';
}
