import '../../../../../glue_core.dart';

class FindIngredientsByIdsInput extends UseCaseInput {
  List<Identifier> ingredientsIds;

  FindIngredientsByIdsInput({required this.ingredientsIds});
}
