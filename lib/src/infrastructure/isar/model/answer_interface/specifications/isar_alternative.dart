import 'package:isar/isar.dart';

import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';

part 'isar_alternative.g.dart';

@Name('Alternative')
@collection
class IsarAlternative implements IsarModel {
  @override
  Id? id;

  String description;

  IsarAlternative({
    this.id,
    required this.description,
  });
}
