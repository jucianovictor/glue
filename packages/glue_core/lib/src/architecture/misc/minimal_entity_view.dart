part of glue_core;

abstract class MinimalEntityView<ID extends Identifier> implements Labelable {
  final ID? id;
  @override
  final String label;

  MinimalEntityView({required this.id, required this.label});
}
