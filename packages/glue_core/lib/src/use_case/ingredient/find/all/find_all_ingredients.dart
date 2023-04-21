// import 'package:glue_core/src/use_case/ingredient/found_ingredient_output.dart';

// import '../../../../../glue_core.dart';
// import '../../../../architecture/use_case/common/operation/find_all_use_case.dart';
// import '../../../../domain/ingredient/entity/ingredient.dart';
// import '../../../../domain/ingredient/repository/ingredient_repository.dart';

// class FindAllIngredientsUseCase extends FindAllUseCase<
//     Identifier,
//     Ingredient,
//     IngredientRepository<Datasource>,
//     FindAllIngredientsInput,
//     FindAllIngredientsOutput> {
//   FindAllIngredientsUseCase(super.repository);

//   @override
//   FindAllIngredientsOutput buildOutput(
//           List<Ingredient> foundedEntities, FindAllIngredientsOutput output) =>
//       FindAllIngredientsOutput(
//           ingredients: _entityFoundToOutput(foundedEntities));

//   @override
//   Future<FindAllIngredientsOutput> execute(FindAllIngredientsInput input) =>
//       handleErrors(findAll, input, FindAllIngredientsOutput.empty());

//   List<FoundIngredientOutput> _entityFoundToOutput(List<Ingredient> entities) =>
//       entities
//           .map((entity) => FoundIngredientOutput(
//               id: entity.id!,
//               name: entity.name,
//               createdAt: entity.createdAt!,
//               updatedAt: entity.updatedAt))
//           .toList();
// }
