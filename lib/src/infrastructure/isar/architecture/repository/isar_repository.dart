import 'package:glue/src/infrastructure/isar/architecture/model/isar_model.dart';
import 'package:glue/src/infrastructure/isar/isar_datasource.dart';
import 'package:glue_core/glue_core.dart';

abstract class IsarEntityRepository<
        TID extends dynamic,
        ID extends Identifier<TID>,
        E extends Entity<ID>,
        M extends IsarModel> extends EntityRepository<ID, E, IsarDatasource>
    implements EntityModelRepository<TID, ID, E, M, IsarDatasource> {}
