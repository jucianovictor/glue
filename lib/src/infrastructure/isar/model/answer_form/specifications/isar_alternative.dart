import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';
import 'package:glue/src/infrastructure/isar/model/answer_form/specifications/isar_alternatives.dart';
import 'package:isar/isar.dart';

@collection
class IsarAlternative implements IsarModel {
  @override
  Id? id;

  late String description;

  final alternativesAnswer = IsarLink<IsarAlternatives>();
}
