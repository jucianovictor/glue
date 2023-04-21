/// Support for doing something awesome.
///
/// More dartdocs go here.
library glue_core;

//External
import 'package:uuid/uuid.dart';
import 'package:logger/logger.dart' as logger;

// Architecture

// Architecture - Domain
part 'src/architecture/domain/domain.dart';
part 'src/architecture/domain/nameable_domain.dart';

// Architecture - Domain - Entity
part 'src/architecture/domain/entity/entity.dart';
part 'src/architecture/domain/entity/auditable_entity.dart';

// Architecture - Domain - Service
part 'src/architecture/domain/service/domain_service.dart';

// Architecture - Domain - Value Object
part 'src/architecture/domain/value_object/value_object.dart';

// Architecture - Identifier
part 'src/architecture/id/identifier.dart';

// Architecture - Identifier - Adapters
part 'src/architecture/id/adapters/int_identifier.dart';
part 'src/architecture/id/adapters/universally_unique_identifier.dart';

// Architecture - Misc
part 'src/architecture/misc/labelable.dart';
part 'src/architecture/misc/minimal_entity_view.dart';

// Architecture - Repository
part 'src/architecture/repository/repository.dart';
part 'src/architecture/repository/entity_repository.dart';
part 'src/architecture/repository/datasource.dart';
part 'src/architecture/repository/datasource_connection.dart';

// Architecture - Repository - Common
part 'src/architecture/repository/common/generic_repository.dart';

// Architecture - Repository - Operation
part 'src/architecture/repository/operation/count_repository.dart';
part 'src/architecture/repository/operation/delete_by_id_repository.dart';
part 'src/architecture/repository/operation/find_all_repository.dart';
part 'src/architecture/repository/operation/find_all_by_ids_repository.dart';
part 'src/architecture/repository/operation/find_by_id_repository.dart';
part 'src/architecture/repository/operation/save_repository.dart';

// Architecture - UseCase
part 'src/architecture/use_case/use_case.dart';
part 'src/architecture/use_case/use_case_input.dart';
part 'src/architecture/use_case/use_case_output.dart';
part 'src/architecture/use_case/sync_use_case.dart';
part 'src/architecture/use_case/async_use_case.dart';

// Architecture - UseCase - Common
part 'src/architecture/use_case/common/found_entity_output.dart';

// Architecture - UseCase - Common - mixin
part 'src/architecture/use_case/common/mixin/default_async_errors_handler.dart';

// Architecture - UseCase - Common - Operation
part 'src/architecture/use_case/common/operation/create_use_case.dart';
part 'src/architecture/use_case/common/operation/delete_by_id_use_case.dart';
part 'src/architecture/use_case/common/operation/find_all_use_case.dart';
part 'src/architecture/use_case/common/operation/find_by_id_use_case.dart';
part 'src/architecture/use_case/common/operation/find_by_ids_use_case.dart';
part 'src/architecture/use_case/common/operation/update_use_case.dart';

// Architecture - Util
part 'src/architecture/util/indirection.dart';

// Architecture - Util - Logger
part 'src/architecture/util/logger/logger.dart';
part 'src/architecture/util/logger/log_level.dart';

// Architecture - validation
part 'src/architecture/validation/validable.dart';
part 'src/architecture/validation/validation_input.dart';
part 'src/architecture/validation/validation_output.dart';

// Architecture - validation - error
part 'src/architecture/validation/error/application_error.dart';

// Architecture - validation - error - implementation
part 'src/architecture/validation/error/implementation/implementation_error.dart';

// Architecture - validation - error - implementation - use case
part 'src/architecture/validation/error/implementation/use_case/use_case_implementation_error.dart';

// Architecture - validation - error - implementation - repository
part 'src/architecture/validation/error/implementation/repository/entity_not_found_repository_implementation_error.dart';
part 'src/architecture/validation/error/implementation/repository/persistence_repository_implementation_error.dart';
part 'src/architecture/validation/error/implementation/repository/repository_implementation_error.dart';

// Architecture - validation - error - implementation - entity
part 'src/architecture/validation/error/implementation/entity/entity_implementation_error.dart';

// Architecture - validation - error - unexpected
part 'src/architecture/validation/error/unexpected/unexpected_error.dart';

// Architecture - validation - exception
part 'src/architecture/validation/exception/application_exception.dart';

// Architecture - validation - exception - domain
part 'src/architecture/validation/exception/domain/domain_exception.dart';
part 'src/architecture/validation/exception/domain/invalid_entity_domain_exception.dart';
part 'src/architecture/validation/exception/domain/invalid_value_object_domain_exception.dart';
part 'src/architecture/validation/exception/domain/no_entity_found_domain_exception.dart';

// Architecture - validation - exception - repository
part 'src/architecture/validation/exception/others/unable_connect_repository_exception.dart';

// Domain

// Domain - ContentBlock
part 'src/domain/dynamic_content/dynamic_content.dart';

// Domain - Block
part 'src/domain/block/block.dart';
part 'src/domain/block/block_type.dart';

// Domain - Block - Repository
part 'src/domain/block/repository/block_repository.dart';

// Domain - Card
part 'src/domain/card/card.dart';

// Domain - Card - Answer
part 'src/domain/card/aggregate/answer_form/answer_form.dart';
part 'src/domain/card/aggregate/answer_form/answer_form_type.dart';

// Domain - Card - Answer - Repository
part 'src/domain/card/aggregate/answer_form/repository/answer_form_repository.dart';

// Domain - Card - Alternative
part 'src/domain/card/aggregate/answer_form/impl/alternatives/alternatives.dart';
part 'src/domain/card/aggregate/answer_form/impl/alternatives/alternative.dart';

// Domain - Card - Repository
part 'src/domain/card/repository/card_repository.dart';

// UseCase - Ingredient
// part 'src/use_case/ingredient/create/create_ingredient.dart';
// part 'src/use_case/ingredient/create/create_ingredient_input.dart';
// part 'src/use_case/ingredient/create/create_ingredient_output.dart';

// part 'src/use_case/ingredient/find/all/find_all_ingredients.dart';
// part 'src/use_case/ingredient/find/all/find_all_ingredients_input.dart';
// part 'src/use_case/ingredient/find/all/find_all_ingredients_output.dart';

// part 'src/use_case/ingredient/find/by_id/find_ingredient_by_id.dart';
// part 'src/use_case/ingredient/find/by_id/find_ingredient_by_id_input.dart';
// part 'src/use_case/ingredient/find/by_id/find_ingredient_by_id_output.dart';

// part 'src/use_case/ingredient/find/by_ids/find_ingredients_by_ids.dart';
// part 'src/use_case/ingredient/find/by_ids/find_ingredients_by_ids_input.dart';
// part 'src/use_case/ingredient/find/by_ids/find_ingredients_by_ids_output.dart';
