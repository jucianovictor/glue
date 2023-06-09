import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';
import 'package:glue/src/infrastructure/isar/architecture/repository/isar_repository.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue_core/glue_core.dart';
import 'package:isar/isar.dart';

abstract class GenericIsarEntityRepository<ID extends Identifier<int>,
        E extends Entity<ID>, M extends IsarModel>
    implements
        IsarEntityRepository<int, ID, E, M>,
        GenericEntityRepository<int, ID, E, M, IsarDatasource> {
  @override
  IsarDatasource datasource;
  late IsarCollection<M> collection;

  GenericIsarEntityRepository(this.datasource) {
    collection = this.datasource.getCollection<M>();
  }

  @override
  Future<int> count() {
    return collection.count();
  }

  @override
  Future<void> deleteById(ID id) async {
    return this.datasource.asyncReadAndWriteTransaction(
        () => collection.delete(fromIdentifier(id)));
  }

  @override
  Future<void> deleteByIds(List<ID> ids) async {
    return this.datasource.asyncReadAndWriteTransaction(
        () => collection.deleteAll(ids.map(fromIdentifier).toList()));
  }

  @override
  Future<List<E>> findAll() async {
    List<M> models = (await collection.where().findAll());
    return models.map(modelToEntity).toList();
  }

  @override
  Future<E> findById(ID id) async {
    M? model = await collection.get(fromIdentifier(id));

    if (model == null) {
      throw EntityNotFoundRepositoryImplementationError.byId(
          id: id, repository: this);
    }

    return modelToEntity(model);
  }

  @override
  Future<List<E>> findByIds(List<ID> identifiers) async {
    List<int> ids = identifiers.map(fromIdentifier).toList();
    List<M?> models = await collection.getAll(ids);

    if (models.isEmpty || models.length != ids.length) {
      throw EntityNotFoundRepositoryImplementationError.byIds(
          ids: identifiers.toSet(), repository: this);
    }

    return models.map((m) => modelToEntity(m!)).toList();
  }

  @override
  Future<ID> save({required E entity}) async {
    int id = await datasource.asyncReadAndWriteTransaction<int>(
        () => collection.put(entityToModel(entity)));
    return toIdentifier(id);
  }

  @override
  Future<List<ID>> saveAll({required List<E> entities}) async {
    List<int> ids = await datasource.asyncReadAndWriteTransaction<List<int>>(
        () => collection.putAll(entities.map(entityToModel).toList()));
    return ids.map(toIdentifier).toList();
  }

  @override
  int fromIdentifier(ID id) {
    return (id as IntID).value;
  }

  @override
  ID toIdentifier(int id) {
    return IntID(id) as ID;
  }
}
