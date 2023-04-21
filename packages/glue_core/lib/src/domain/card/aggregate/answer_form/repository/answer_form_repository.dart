part of glue_core;

abstract class AnswerFormRepository<DS extends Datasource>
    extends GenericEntityRepository<IntID, AnswerForm, DS> {}
