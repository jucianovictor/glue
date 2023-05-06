part of glue_core;

class Card implements AuditableEntity<IntID> {
  @override
  IntID? id;

  @override
  DateTime? updatedAt;

  @override
  DateTime? createdAt;

  DynamicContent sentence;
  AnswerInterface answer;

  Card({required this.sentence, required this.answer});

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(object: this, input: input)
      ..addExceptionFromMessageIf(
          sentence.isEmpty,
          'Card não pode estar sem uma questão.',
          'Adicione uma questão no Card.');
  }
}
