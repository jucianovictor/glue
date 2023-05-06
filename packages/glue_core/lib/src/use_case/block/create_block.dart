import 'package:glue_core/glue_core.dart';

import 'create_block_input.dart';
import 'create_block_output.dart';

class CreateBlockUseCase extends CreateUseCase<Identifier, Block,
    BlockRepository, CreateBlockInput, CreateBlockOutput> {
  final BlockRepository ingredientRepository;

  CreateBlockUseCase({required this.ingredientRepository})
      : super(ingredientRepository);

  @override
  Future<CreateBlockOutput> execute(input) =>
      handleErrors(create, input, CreateBlockOutput());

  @override
  CreateBlockOutput buildOutput(Identifier identifier) =>
      CreateBlockOutput(identifier);

  @override
  Block inputToEntity(CreateBlockInput input) => Block();
}
