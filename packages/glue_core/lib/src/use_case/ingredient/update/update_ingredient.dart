// import 'package:glue_core/glue_core.dart';

// import '../../../architecture/use_case/common/operation/update_use_case.dart';
// import '../../../domain/ingredient/entity/ingredient.dart';
// import '../../../domain/ingredient/repository/ingredient_repository.dart';
// import 'update_ingredient_input.dart';
// import 'update_ingredient_output.dart';

// class UpdateIngredientUseCase extends UpdateUseCase<Identifier, Ingredient,
//     IngredientRepository, UpdateIngredientInput, UpdateIngredientOutput> {
//   final IngredientRepository ingredientRepository;

//   UpdateIngredientUseCase({required this.ingredientRepository})
//       : super(ingredientRepository);

//   @override
//   Future<UpdateIngredientOutput> execute(input) =>
//       handleErrors(update, input, UpdateIngredientOutput());

//   @override
//   UpdateIngredientOutput buildOutput(Identifier identifier) =>
//       UpdateIngredientOutput(identifier);

//   @override
//   Ingredient inputToEntity(UpdateIngredientInput input) =>
//       Ingredient(name: input.name);
// }
