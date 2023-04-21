// import 'package:glue_core/src/domain/ingredient/entity/ingredient.dart';

// import 'package:glue_core/glue_core.dart';

// import '../../../architecture/use_case/common/operation/create_use_case.dart';
// import '../../../domain/ingredient/repository/ingredient_repository.dart';
// import 'create_ingredient_input.dart';
// import 'create_ingredient_output.dart';

// class CreateIngredientUseCase extends CreateUseCase<Identifier, Ingredient,
//     IngredientRepository, CreateIngredientInput, CreateIngredientOutput> {
//   final IngredientRepository ingredientRepository;

//   CreateIngredientUseCase({required this.ingredientRepository})
//       : super(ingredientRepository);

//   @override
//   Future<CreateIngredientOutput> execute(input) =>
//       handleErrors(create, input, CreateIngredientOutput());

//   @override
//   CreateIngredientOutput buildOutput(Identifier identifier) =>
//       CreateIngredientOutput(identifier);

//   @override
//   Ingredient inputToEntity(CreateIngredientInput input) =>
//       Ingredient(name: input.name);
// }
