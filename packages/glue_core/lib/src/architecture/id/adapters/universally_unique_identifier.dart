part of glue_core;

class UUID implements Identifier<String> {
  final String _uuid;

  UUID([String? uuid]) : _uuid = uuid ?? Uuid().v1();

  @override
  String get value => _uuid;

  @override
  String toString() => 'UUID{uuid: $_uuid}';

  DateTime getTimeStamp() {
    throw UnimplementedError();
  }

  @override
  ValidationOutput validate({ValidationInput? input}) =>
      ValidationOutput(object: this, input: input)
        ..addIfThrow(() => Uuid.isValidOrThrow(fromString: _uuid));
}
