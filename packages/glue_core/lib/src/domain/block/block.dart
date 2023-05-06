part of glue_core;

class Block implements Entity<IntID> {
  @override
  IntID? id;

  BlockType type;
  String value;
  Map<String, String> props;

  Block(
      {this.id, required this.value, required this.type, required this.props});

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(object: this, input: input);
  }
}
