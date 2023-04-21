part of glue_core;

/// An entity is an object that represents a distinct and usable thing or
/// concept in a domain.
///
/// An entity has a unique identity that differentiates it from other entities
/// in the domain, regardless of its attributes and values. In other words,
/// an entity is an object that has its own identity, which can be maintained
/// over time, even if its attributes and values change.
abstract class Entity<ID extends Identifier> implements Validable, Domain {
  ID? id;

  Entity(this.id);

  @override
  String toString() => '{id: $id}';
}
