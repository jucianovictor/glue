part of glue_core;

class AlternativesInterface extends AnswerInterface {
  Set<Alternative> alternatives;
  Set<Identifier> correctAlternatives;
  Set<Identifier>? selectedAlternatives;

  AlternativesInterface(
      {super.id,
      required this.alternatives,
      required this.correctAlternatives,
      required super.explanation,
      super.createdAt,
      super.updatedAt});

  void selectAlternatives(Set<Identifier> alternatives) {
    selectedAlternatives = alternatives;
  }

  bool _selectedAnswersSetAndcorrectAnswersSetAreEquals() {
    if (selectedAlternatives == null) {
      return false;
    }
    return selectedAlternatives!.difference(correctAlternatives).isEmpty;
  }

  //Rule
  //It is only considered as a correct answer when the set of correct answers
  //is equal to the set of selected answers
  @override
  bool get isCorrect => _selectedAnswersSetAndcorrectAnswersSetAreEquals();

  @override
  AnswerInterfaceType get type => AnswerInterfaceType.alternatives;

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(object: this, input: input);
  }
}
