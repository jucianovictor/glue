part of glue_core;

class Card implements AuditableEntity<IntID> {
  @override
  IntID? id;

  @override
  DateTime? updatedAt;

  @override
  DateTime? createdAt;

  DynamicContent sentence;
  AnswerForm answer;

  Card({required this.sentence, required this.answer});

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(utilizedObject: this, input: input)
      ..addExceptionFromMessageIf(
          sentence.isEmpty,
          'Card não pode estar sem uma questão.',
          'Adicione uma questão no Card.');
  }
}
