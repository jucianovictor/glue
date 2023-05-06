part of glue_core;

class Alternative implements Entity<IntID> {
  @override
  IntID? id;

  String value;

  Alternative({this.id, required this.value});

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(object: this, input: input)
      ..addExceptionFromMessageIf(
          value.isEmpty, 'A descrição não pode estar vazia.');
  }
}
