part of glue_core;

enum BlockType {
  text(1),
  title(2);

  final int value;
  const BlockType(this.value);
}
