part of glue_core;

abstract class FoundEntityOutput {
  Identifier id;
  DateTime createdAt;
  DateTime? updatedAt;

  FoundEntityOutput({
    required this.id,
    required this.createdAt,
    this.updatedAt,
  });
}
