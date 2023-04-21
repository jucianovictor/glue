part of glue_core;

class EntityImplementationError<E extends Entity> extends ImplementationError {
  E? entity;
  List<E>? entities;

  EntityImplementationError.thisEntity({required this.entity, String? detail})
      : super(
            message: 'Invalid entity.',
            detail: 'Entity: $entity${detail != null ? ' $detail' : ''}');

  EntityImplementationError.theseEntities(
      {required this.entities, String? detail})
      : super(
            message: 'Invalid entities.',
            detail: 'Entities: $entities${detail != null ? ' $detail' : ''}');
}
