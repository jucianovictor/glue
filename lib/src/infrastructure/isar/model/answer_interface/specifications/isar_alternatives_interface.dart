import '../../block/isar_block.dart';
import '../isar_answer_interface.dart';
import 'isar_alternative.dart';
import 'package:isar/isar.dart';
import 'package:glue_core/glue_core.dart';

part 'isar_alternatives_interface.g.dart';

@Collection(inheritance: true)
@Name('AlternativesInterface')
class IsarAlternativesInterface extends IsarAnswerInterface {
  final explanation = IsarLinks<IsarBlock>();

  final alternatives = IsarLinks<IsarAlternative>();

  final correctAlternatives = IsarLinks<IsarAlternative>();

  IsarAlternativesInterface({super.id, DateTime? createdAt, super.updatedAt})
      : super(
            type: AnswerInterfaceType.alternatives,
            createdAt: createdAt ?? DateTime.now());
}
