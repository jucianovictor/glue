part of glue_core;

class Alternative implements Entity<IntID> {
  @override
  IntID? id;

  String description;

  Alternative({required this.description});

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(utilizedObject: this, input: input)
      ..addExceptionFromMessageIf(
          description.isEmpty, 'A descrição não pode estar vazia.');
  }
}
