import '../../../../../glue_core.dart';

import '../../found_ingredient_output.dart';

class FindAllIngredientsOutput extends UseCaseOutput {
  List<FoundIngredientOutput>? ingredients;

  FindAllIngredientsOutput.empty();
  FindAllIngredientsOutput({required this.ingredients});
}
