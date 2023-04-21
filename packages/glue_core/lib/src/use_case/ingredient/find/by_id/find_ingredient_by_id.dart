// import '../../../../../glue_core.dart';
// import '../../../../architecture/use_case/common/operation/find_by_id_use_case.dart';
// import '../../../../domain/ingredient/entity/ingredient.dart';
// import '../../../../domain/ingredient/repository/ingredient_repository.dart';

// class FindIngredientByIdUseCase extends FindByIdUseCase<Identifier, Ingredient,
//     IngredientRepository, FindIngredientByIdInput, FindIngredientByIdOutput> {
//   FindIngredientByIdUseCase(super.repository);

//   @override
//   FindIngredientByIdOutput buildOutput(Ingredient entity) =>
//       FindIngredientByIdOutput.required(
//         id: entity.id!,
//         name: entity.name,
//         createdAt: entity.createdAt!,
//         updatedAt: entity.updatedAt,
//       );

//   @override
//   Future<FindIngredientByIdOutput> execute(FindIngredientByIdInput input) =>
//       handleErrors(findById, input, FindIngredientByIdOutput.empty());

//   @override
//   Identifier extractIdentifierFromInput(FindIngredientByIdInput input) =>
//       input.id;
// }
