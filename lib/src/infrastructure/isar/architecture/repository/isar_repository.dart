import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue_core/glue_core.dart';

abstract class IsarEntityRepository<ID extends Identifier, E extends Entity<ID>,
    M extends IsarModel> extends EntityRepository<ID, E, IsarDatasource> {
  M entityToModel(E entity);
  E modelToEntity(M model);
  int idFromIdentifier(Identifier id);
  ID idToIdentifier(int id);
}
