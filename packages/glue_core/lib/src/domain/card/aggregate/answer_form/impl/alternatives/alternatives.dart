part of glue_core;

class AlternativesForm extends AnswerForm {
  Set<Alternative> alternatives;
  Set<Identifier> correctAlternatives;
  Set<Identifier>? selectedAlternatives;

  AlternativesForm(
      {required this.alternatives, required this.correctAlternatives});

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
  AnswerFormType get type => AnswerFormType.alternatives;

  @override
  ValidationOutput validate({ValidationInput? input}) {
    return ValidationOutput(utilizedObject: this, input: input);
  }
}
