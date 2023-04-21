import '../../../../../glue_core.dart';
import '../../found_ingredient_output.dart';

class FindIngredientByIdOutput extends UseCaseOutput {
  FoundIngredientOutput? ingredient;

  FindIngredientByIdOutput.empty();
  FindIngredientByIdOutput.required({
    required Identifier id,
    required String name,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : ingredient = FoundIngredientOutput(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
