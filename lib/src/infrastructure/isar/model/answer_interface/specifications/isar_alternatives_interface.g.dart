// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_alternatives_interface.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetIsarAlternativesInterfaceCollection on Isar {
  IsarCollection<IsarAlternativesInterface> get isarAlternativesInterfaces =>
      this.collection();
}

const IsarAlternativesInterfaceSchema = CollectionSchema(
  name: r'AlternativesInterface',
  id: 6508662222722957543,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'type': PropertySchema(
      id: 1,
      name: r'type',
      type: IsarType.byte,
      enumMap: _IsarAlternativesInterfacetypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 2,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _isarAlternativesInterfaceEstimateSize,
  serialize: _isarAlternativesInterfaceSerialize,
  deserialize: _isarAlternativesInterfaceDeserialize,
  deserializeProp: _isarAlternativesInterfaceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'explanation': LinkSchema(
      id: -1911391776881695269,
      name: r'explanation',
      target: r'block',
      single: false,
    ),
    r'alternatives': LinkSchema(
      id: 6141856794745983601,
      name: r'alternatives',
      target: r'Alternative',
      single: false,
    ),
    r'correctAlternatives': LinkSchema(
      id: -6806005687513687305,
      name: r'correctAlternatives',
      target: r'Alternative',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarAlternativesInterfaceGetId,
  getLinks: _isarAlternativesInterfaceGetLinks,
  attach: _isarAlternativesInterfaceAttach,
  version: '3.0.5',
);

int _isarAlternativesInterfaceEstimateSize(
  IsarAlternativesInterface object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarAlternativesInterfaceSerialize(
  IsarAlternativesInterface object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeByte(offsets[1], object.type.index);
  writer.writeDateTime(offsets[2], object.updatedAt);
}

IsarAlternativesInterface _isarAlternativesInterfaceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAlternativesInterface(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    id: id,
    updatedAt: reader.readDateTimeOrNull(offsets[2]),
  );
  object.type = _IsarAlternativesInterfacetypeValueEnumMap[
          reader.readByteOrNull(offsets[1])] ??
      AnswerInterfaceType.alternatives;
  return object;
}

P _isarAlternativesInterfaceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (_IsarAlternativesInterfacetypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AnswerInterfaceType.alternatives) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarAlternativesInterfacetypeEnumValueMap = {
  'alternatives': 0,
  'openText': 1,
};
const _IsarAlternativesInterfacetypeValueEnumMap = {
  0: AnswerInterfaceType.alternatives,
  1: AnswerInterfaceType.openText,
};

Id _isarAlternativesInterfaceGetId(IsarAlternativesInterface object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarAlternativesInterfaceGetLinks(
    IsarAlternativesInterface object) {
  return [object.explanation, object.alternatives, object.correctAlternatives];
}

void _isarAlternativesInterfaceAttach(
    IsarCollection<dynamic> col, Id id, IsarAlternativesInterface object) {
  object.id = id;
  object.explanation
      .attach(col, col.isar.collection<IsarBlock>(), r'explanation', id);
  object.alternatives
      .attach(col, col.isar.collection<IsarAlternative>(), r'alternatives', id);
  object.correctAlternatives.attach(
      col, col.isar.collection<IsarAlternative>(), r'correctAlternatives', id);
}

extension IsarAlternativesInterfaceQueryWhereSort on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QWhere> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarAlternativesInterfaceQueryWhere on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QWhereClause> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarAlternativesInterfaceQueryFilter on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QFilterCondition> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> typeEqualTo(AnswerInterfaceType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> typeGreaterThan(
    AnswerInterfaceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> typeLessThan(
    AnswerInterfaceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> typeBetween(
    AnswerInterfaceType lower,
    AnswerInterfaceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarAlternativesInterfaceQueryObject on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QFilterCondition> {}

extension IsarAlternativesInterfaceQueryLinks on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QFilterCondition> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanation(FilterQuery<IsarBlock> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'explanation');
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanationLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'explanation', length, true, length, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'explanation', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'explanation', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanationLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'explanation', 0, true, length, include);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanationLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'explanation', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> explanationLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'explanation', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternatives(FilterQuery<IsarAlternative> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'alternatives');
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternativesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alternatives', length, true, length, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternativesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alternatives', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternativesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alternatives', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternativesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alternatives', 0, true, length, include);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternativesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'alternatives', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> alternativesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'alternatives', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
          QAfterFilterCondition>
      correctAlternatives(FilterQuery<IsarAlternative> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'correctAlternatives');
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> correctAlternativesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'correctAlternatives', length, true, length, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> correctAlternativesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'correctAlternatives', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> correctAlternativesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'correctAlternatives', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> correctAlternativesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'correctAlternatives', 0, true, length, include);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> correctAlternativesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'correctAlternatives', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterFilterCondition> correctAlternativesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'correctAlternatives', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarAlternativesInterfaceQuerySortBy on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QSortBy> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarAlternativesInterfaceQuerySortThenBy on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QSortThenBy> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarAlternativesInterfaceQueryWhereDistinct on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QDistinct> {
  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<IsarAlternativesInterface, IsarAlternativesInterface, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarAlternativesInterfaceQueryProperty on QueryBuilder<
    IsarAlternativesInterface, IsarAlternativesInterface, QQueryProperty> {
  QueryBuilder<IsarAlternativesInterface, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarAlternativesInterface, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarAlternativesInterface, AnswerInterfaceType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<IsarAlternativesInterface, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
