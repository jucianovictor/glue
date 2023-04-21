part of glue_core;

class ValidationInput {
  Set<int>? ignoreDomains;
  int? validationMaxDepth;
  ValidationOutput? parentValidationOutput;

  ValidationInput(
      {this.ignoreDomains,
      this.validationMaxDepth,
      this.parentValidationOutput});
}
