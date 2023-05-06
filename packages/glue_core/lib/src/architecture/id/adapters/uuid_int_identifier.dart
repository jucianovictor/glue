part of glue_core;

// Talvez no futuro possamos usar para escalar o sistema
class UuidIntIdentifier implements Identifier<Pair<String, int>> {
  @override
  final Pair<String, int> value;

  UuidIntIdentifier({
    required this.value,
  });

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(object: this, input: input)
      ..addErrorIf(value.first.isEmpty, ArgumentError.notNull('uuid'))
      ..addErrorIf(
          value.second < 1,
          RangeError.value(
              value.second, 'id', 'The id must be greater than 0'));
  }
}
