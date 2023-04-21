part of glue_core;

/// Represents an element that can be validated by your business rules.
abstract class Validable {
  ValidationOutput validate({ValidationInput? input});
}
