// import 'package:glue_core/src/architecture/use_case/common/operation/delete_by_id_use_case.dart';

// import 'package:glue_core/glue_core.dart';

// import '../../../domain/ingredient/entity/ingredient.dart';
// import '../../../domain/ingredient/repository/ingredient_repository.dart';
// import 'delete_ingredient_by_id_input.dart';
// import 'delete_ingredient_by_id_output.dart';

// class DeleteIngredientByIdUseCase extends DeleteByIdUseCase<
//     Identifier,
//     Ingredient,
//     IngredientRepository,
//     DeleteIngredientByIdInput,
//     DeleteIngredientByIdOutput> {
//   final IngredientRepository ingredientRepository;

//   DeleteIngredientByIdUseCase({required this.ingredientRepository})
//       : super(ingredientRepository);

//   @override
//   Future<DeleteIngredientByIdOutput> execute(input) =>
//       handleErrors(deleteById, input, DeleteIngredientByIdOutput());

//   @override
//   Identifier extractIdentifierFromInput(DeleteIngredientByIdInput input) =>
//       input.id;
// }
