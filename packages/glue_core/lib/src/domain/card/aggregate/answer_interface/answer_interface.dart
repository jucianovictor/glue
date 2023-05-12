part of glue_core;

// Pode ser qualquer jeito de responder, tipo: https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4EKxvE0ROdiLydv97ouKS-06M-QW_1qG8tQ&usqp=CAU
// ou outro qlqr minigame que possa ser inventado
abstract class AnswerInterface implements AuditableEntity<IntID> {
  @override
  IntID? id;

  @override
  DateTime? updatedAt;

  @override
  DateTime? createdAt;

  late AnswerInterfaceType type;
  late DynamicContent explanation;
  bool? get isCorrect;

  AnswerInterface(
      {this.id, this.updatedAt, this.createdAt, required this.explanation});

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(object: this, input: input);
  }
}
