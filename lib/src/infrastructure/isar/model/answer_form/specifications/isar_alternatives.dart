import 'package:glue/src/infrastructure/isar/model/answer_form/isar_answer_form.dart';
import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';

import 'isar_alternative.dart';

@collection
class IsarAlternatives extends IsarAnswerForm {
  final alternatives = IsarLinks<IsarAlternative>();

  final correctAlternatives = IsarLinks<IsarAlternative>();

  IsarAlternatives() : super(type: AnswerFormType.alternatives);
}
