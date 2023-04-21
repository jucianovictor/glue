part of glue_core;

class IntID implements Identifier<int> {
  final int _id;

  IntID(this._id);

  @override
  int get value => _id;

  @override
  String toString() => 'IntID{id: $_id}';

  @override
  ValidationOutput validate({ValidationInput? input}) =>
      ValidationOutput(utilizedObject: this, input: input)
        ..addErrorIf(_id < 1,
            RangeError.value(value, 'id', 'The id must be greater than 0'));
}
