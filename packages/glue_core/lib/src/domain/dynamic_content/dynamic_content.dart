part of glue_core;

class DynamicContent implements ValueObject {
  List<Block> blocks;

  DynamicContent({required this.blocks});

  get isNotEmpty =>
      blocks.isNotEmpty && blocks.any((block) => block.value.isNotEmpty);

  get isEmpty => !isNotEmpty;

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(utilizedObject: this, input: input);
  }
}
