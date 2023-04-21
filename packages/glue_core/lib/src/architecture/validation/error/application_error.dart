part of glue_core;

class ApplicationError extends Error {
  final String message;
  final String? detail;

  ApplicationError({required this.message, this.detail});

  @override
  String toString() => '$message ${detail ?? ''}';
}
