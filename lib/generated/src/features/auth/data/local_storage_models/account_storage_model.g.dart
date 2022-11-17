// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/auth/data/local_storage_models/account_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAccountStorageModelCollection on Isar {
  IsarCollection<AccountStorageModel> get accountStorageModels =>
      this.collection();
}

const AccountStorageModelSchema = CollectionSchema(
  name: r'AccountStorageModel',
  id: 206958508248210504,
  properties: {
    r'atualizadoEm': PropertySchema(
      id: 0,
      name: r'atualizadoEm',
      type: IsarType.dateTime,
    ),
    r'criadoEm': PropertySchema(
      id: 1,
      name: r'criadoEm',
      type: IsarType.dateTime,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    )
  },
  estimateSize: _accountStorageModelEstimateSize,
  serialize: _accountStorageModelSerialize,
  deserialize: _accountStorageModelDeserialize,
  deserializeProp: _accountStorageModelDeserializeProp,
  idName: r'localId',
  indexes: {
    r'email': IndexSchema(
      id: -26095440403582047,
      name: r'email',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'email',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'contato': LinkSchema(
      id: 5234045250550662992,
      name: r'contato',
      target: r'ContatoStorageModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _accountStorageModelGetId,
  getLinks: _accountStorageModelGetLinks,
  attach: _accountStorageModelAttach,
  version: '3.0.5',
);

int _accountStorageModelEstimateSize(
  AccountStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.email.length * 3;
  return bytesCount;
}

void _accountStorageModelSerialize(
  AccountStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.atualizadoEm);
  writer.writeDateTime(offsets[1], object.criadoEm);
  writer.writeString(offsets[2], object.email);
}

AccountStorageModel _accountStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AccountStorageModel();
  object.atualizadoEm = reader.readDateTimeOrNull(offsets[0]);
  object.criadoEm = reader.readDateTimeOrNull(offsets[1]);
  object.email = reader.readString(offsets[2]);
  return object;
}

P _accountStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accountStorageModelGetId(AccountStorageModel object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _accountStorageModelGetLinks(
    AccountStorageModel object) {
  return [object.contato];
}

void _accountStorageModelAttach(
    IsarCollection<dynamic> col, Id id, AccountStorageModel object) {
  object.contato
      .attach(col, col.isar.collection<ContatoStorageModel>(), r'contato', id);
}

extension AccountStorageModelQueryWhereSort
    on QueryBuilder<AccountStorageModel, AccountStorageModel, QWhere> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhere>
      anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AccountStorageModelQueryWhere
    on QueryBuilder<AccountStorageModel, AccountStorageModel, QWhereClause> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      localIdNotEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      emailEqualTo(String email) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [email],
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterWhereClause>
      emailNotEqualTo(String email) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AccountStorageModelQueryFilter on QueryBuilder<AccountStorageModel,
    AccountStorageModel, QFilterCondition> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      atualizadoEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'atualizadoEm',
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      atualizadoEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'atualizadoEm',
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      atualizadoEmEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      atualizadoEmGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      atualizadoEmLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      atualizadoEmBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'atualizadoEm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      criadoEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criadoEm',
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      criadoEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criadoEm',
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      criadoEmEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      criadoEmGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      criadoEmLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      criadoEmBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'criadoEm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      localIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      localIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      localIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AccountStorageModelQueryObject on QueryBuilder<AccountStorageModel,
    AccountStorageModel, QFilterCondition> {}

extension AccountStorageModelQueryLinks on QueryBuilder<AccountStorageModel,
    AccountStorageModel, QFilterCondition> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      contato(FilterQuery<ContatoStorageModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'contato');
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterFilterCondition>
      contatoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'contato', 0, true, 0, true);
    });
  }
}

extension AccountStorageModelQuerySortBy
    on QueryBuilder<AccountStorageModel, AccountStorageModel, QSortBy> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      sortByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      sortByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      sortByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      sortByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }
}

extension AccountStorageModelQuerySortThenBy
    on QueryBuilder<AccountStorageModel, AccountStorageModel, QSortThenBy> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }
}

extension AccountStorageModelQueryWhereDistinct
    on QueryBuilder<AccountStorageModel, AccountStorageModel, QDistinct> {
  QueryBuilder<AccountStorageModel, AccountStorageModel, QDistinct>
      distinctByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atualizadoEm');
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QDistinct>
      distinctByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criadoEm');
    });
  }

  QueryBuilder<AccountStorageModel, AccountStorageModel, QDistinct>
      distinctByEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }
}

extension AccountStorageModelQueryProperty
    on QueryBuilder<AccountStorageModel, AccountStorageModel, QQueryProperty> {
  QueryBuilder<AccountStorageModel, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<AccountStorageModel, DateTime?, QQueryOperations>
      atualizadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atualizadoEm');
    });
  }

  QueryBuilder<AccountStorageModel, DateTime?, QQueryOperations>
      criadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criadoEm');
    });
  }

  QueryBuilder<AccountStorageModel, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }
}
