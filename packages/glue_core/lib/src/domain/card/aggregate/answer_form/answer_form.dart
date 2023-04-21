part of glue_core;

abstract class AnswerForm implements AuditableEntity<IntID> {
  @override
  IntID? id;

  @override
  DateTime? updatedAt;

  @override
  DateTime? createdAt;

  late AnswerFormType type;
  late DynamicContent explanation;
  bool? get isCorrect;
}
