import 'package:glue_core/glue_core.dart';

class FoundIngredientOutput {
  final Identifier id;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;

  FoundIngredientOutput({
    required this.id,
    required this.name,
    required this.createdAt,
    this.updatedAt,
  });
}
