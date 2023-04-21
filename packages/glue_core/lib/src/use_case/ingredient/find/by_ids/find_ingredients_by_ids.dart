// import 'package:glue_core/src/use_case/ingredient/found_ingredient_output.dart';

// import '../../../../../glue_core.dart';
// import '../../../../architecture/use_case/common/operation/find_by_ids_use_case.dart';
// import '../../../../domain/ingredient/entity/ingredient.dart';
// import '../../../../domain/ingredient/repository/ingredient_repository.dart';

// class FindIngredientsByIdsUseCase extends FindByIdsUseCase<
//     Identifier,
//     Ingredient,
//     IngredientRepository<Datasource>,
//     FindIngredientsByIdsInput,
//     FindIngredientsByIdsOutput> {
//   FindIngredientsByIdsUseCase(super.repository);

//   @override
//   FindIngredientsByIdsOutput buildOutput(List<Ingredient> foundedEntities,
//           FindIngredientsByIdsOutput output) =>
//       FindIngredientsByIdsOutput(
//           ingredients: _entityFoundToOutput(foundedEntities));

//   @override
//   Future<FindIngredientsByIdsOutput> execute(FindIngredientsByIdsInput input) =>
//       handleErrors(findByIds, input, FindIngredientsByIdsOutput.empty());

//   @override
//   List<Identifier> inputToIdentifiers(FindIngredientsByIdsInput input) =>
//       input.ingredientsIds;

//   List<FoundIngredientOutput> _entityFoundToOutput(List<Ingredient> entities) =>
//       entities
//           .map((entity) => FoundIngredientOutput(
//               id: entity.id!,
//               name: entity.name,
//               createdAt: entity.createdAt!,
//               updatedAt: entity.updatedAt))
//           .toList();
// }
