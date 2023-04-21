part of glue_core;

class ApplicationException implements Exception {
  final String message;
  final String? tip;

  ApplicationException({required this.message, this.tip});

  @override
  String toString() => message;
}
