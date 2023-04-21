import '../../../../../glue_core.dart';

import '../../found_ingredient_output.dart';

class FindIngredientsByIdsOutput extends UseCaseOutput {
  List<FoundIngredientOutput>? ingredients;

  FindIngredientsByIdsOutput.empty();
  FindIngredientsByIdsOutput({required this.ingredients});
}
