part of glue_core;

mixin DefaultAsyncErrorsHandler<I extends UseCaseInput,
    O extends UseCaseOutput> {
  Future<O> handleErrors(Future<O> Function(I input, O output) execute, I input,
          O output) async =>
      await execute
          .call(input, output)
          .catchError(
              (error) => _logAndReturnOutput(output, [error])..addError(error),
              test: (error) => error is ApplicationError)
          .catchError(
              (errors) => _logAndReturnOutput(output, errors)..addErrors,
              test: (error) => error is List<ApplicationError>)
          .catchError(
              (error) => _logAndReturnOutput(
                  output, (error is List ? error : [error]))
                ..addError(UnexpectedError.fromObject(originalObject: error)),
              test: (error) => true)
          .onError((error, stackTrace) => _logAndReturnOutput(output, [error]))
          .whenComplete(() {
        if (output.isInvalid) {
          output.applicationErrors.forEach(Logger.error);
          output.applicationExceptions.forEach(Logger.error);
        }
      });

  O _logAndReturnOutput(O output, List<dynamic> errors, [String? message]) {
    errors.map((e) => e.toString()).forEach(Logger.error);
    Logger.info(message);
    return output;
  }
}
