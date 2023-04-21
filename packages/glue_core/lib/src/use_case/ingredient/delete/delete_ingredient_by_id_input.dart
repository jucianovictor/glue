import 'package:glue_core/glue_core.dart';

class DeleteIngredientByIdInput extends UseCaseInput {
  Identifier id;

  DeleteIngredientByIdInput({
    required this.id,
  });
}
