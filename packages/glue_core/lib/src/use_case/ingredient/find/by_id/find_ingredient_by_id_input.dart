import '../../../../../glue_core.dart';

class FindIngredientByIdInput extends UseCaseInput {
  final Identifier id;

  FindIngredientByIdInput({required this.id});
}
