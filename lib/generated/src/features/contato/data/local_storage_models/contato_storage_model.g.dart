// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/contato/data/local_storage_models/contato_storage_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetContatoStorageModelCollection on Isar {
  IsarCollection<ContatoStorageModel> get contatoStorageModels =>
      this.collection();
}

const ContatoStorageModelSchema = CollectionSchema(
  name: r'ContatoStorageModel',
  id: 5867110078814108653,
  properties: {
    r'ativo': PropertySchema(
      id: 0,
      name: r'ativo',
      type: IsarType.bool,
    ),
    r'atualizadoEm': PropertySchema(
      id: 1,
      name: r'atualizadoEm',
      type: IsarType.dateTime,
    ),
    r'categorias': PropertySchema(
      id: 2,
      name: r'categorias',
      type: IsarType.byteList,
    ),
    r'criadoEm': PropertySchema(
      id: 3,
      name: r'criadoEm',
      type: IsarType.dateTime,
    ),
    r'nome': PropertySchema(
      id: 4,
      name: r'nome',
      type: IsarType.string,
    ),
    r'telefones': PropertySchema(
      id: 5,
      name: r'telefones',
      type: IsarType.stringList,
    ),
    r'uid': PropertySchema(
      id: 6,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _contatoStorageModelEstimateSize,
  serialize: _contatoStorageModelSerialize,
  deserialize: _contatoStorageModelDeserialize,
  deserializeProp: _contatoStorageModelDeserializeProp,
  idName: r'localId',
  indexes: {
    r'uid': IndexSchema(
      id: 8193695471701937315,
      name: r'uid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'account': LinkSchema(
      id: 6598309729821993351,
      name: r'account',
      target: r'AccountStorageModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _contatoStorageModelGetId,
  getLinks: _contatoStorageModelGetLinks,
  attach: _contatoStorageModelAttach,
  version: '3.0.4',
);

int _contatoStorageModelEstimateSize(
  ContatoStorageModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categorias.length;
  bytesCount += 3 + object.nome.length * 3;
  bytesCount += 3 + object.telefones.length * 3;
  {
    for (var i = 0; i < object.telefones.length; i++) {
      final value = object.telefones[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _contatoStorageModelSerialize(
  ContatoStorageModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.ativo);
  writer.writeDateTime(offsets[1], object.atualizadoEm);
  writer.writeByteList(offsets[2], object.categorias);
  writer.writeDateTime(offsets[3], object.criadoEm);
  writer.writeString(offsets[4], object.nome);
  writer.writeStringList(offsets[5], object.telefones);
  writer.writeString(offsets[6], object.uid);
}

ContatoStorageModel _contatoStorageModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ContatoStorageModel();
  object.ativo = reader.readBoolOrNull(offsets[0]);
  object.atualizadoEm = reader.readDateTimeOrNull(offsets[1]);
  object.categorias = reader.readByteList(offsets[2]) ?? [];
  object.criadoEm = reader.readDateTimeOrNull(offsets[3]);
  object.nome = reader.readString(offsets[4]);
  object.telefones = reader.readStringList(offsets[5]) ?? [];
  object.uid = reader.readString(offsets[6]);
  return object;
}

P _contatoStorageModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readByteList(offset) ?? []) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _contatoStorageModelGetId(ContatoStorageModel object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _contatoStorageModelGetLinks(
    ContatoStorageModel object) {
  return [object.account];
}

void _contatoStorageModelAttach(
    IsarCollection<dynamic> col, Id id, ContatoStorageModel object) {
  object.account
      .attach(col, col.isar.collection<AccountStorageModel>(), r'account', id);
}

extension ContatoStorageModelQueryWhereSort
    on QueryBuilder<ContatoStorageModel, ContatoStorageModel, QWhere> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhere>
      anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContatoStorageModelQueryWhere
    on QueryBuilder<ContatoStorageModel, ContatoStorageModel, QWhereClause> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
      localIdEqualTo(Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
      localIdLessThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
      uidEqualTo(String uid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uid',
        value: [uid],
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterWhereClause>
      uidNotEqualTo(String uid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [uid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uid',
              lower: [],
              upper: [uid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ContatoStorageModelQueryFilter on QueryBuilder<ContatoStorageModel,
    ContatoStorageModel, QFilterCondition> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      ativoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ativo',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      ativoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ativo',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      ativoEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ativo',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      atualizadoEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'atualizadoEm',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      atualizadoEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'atualizadoEm',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      atualizadoEmEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'atualizadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categorias',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categorias',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categorias',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categorias',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      categoriasLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categorias',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      criadoEmIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'criadoEm',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      criadoEmIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'criadoEm',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      criadoEmEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'criadoEm',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
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

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'telefones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'telefones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'telefones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'telefones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'telefones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'telefones',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'telefones',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'telefones',
        value: '',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'telefones',
        value: '',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'telefones',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'telefones',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'telefones',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'telefones',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'telefones',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      telefonesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'telefones',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension ContatoStorageModelQueryObject on QueryBuilder<ContatoStorageModel,
    ContatoStorageModel, QFilterCondition> {}

extension ContatoStorageModelQueryLinks on QueryBuilder<ContatoStorageModel,
    ContatoStorageModel, QFilterCondition> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      account(FilterQuery<AccountStorageModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'account');
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterFilterCondition>
      accountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'account', 0, true, 0, true);
    });
  }
}

extension ContatoStorageModelQuerySortBy
    on QueryBuilder<ContatoStorageModel, ContatoStorageModel, QSortBy> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByAtivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension ContatoStorageModelQuerySortThenBy
    on QueryBuilder<ContatoStorageModel, ContatoStorageModel, QSortThenBy> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByAtivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ativo', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByAtualizadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atualizadoEm', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByCriadoEmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'criadoEm', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QAfterSortBy>
      thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension ContatoStorageModelQueryWhereDistinct
    on QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct> {
  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByAtivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ativo');
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByAtualizadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atualizadoEm');
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByCategorias() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categorias');
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByCriadoEm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'criadoEm');
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByNome({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByTelefones() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'telefones');
    });
  }

  QueryBuilder<ContatoStorageModel, ContatoStorageModel, QDistinct>
      distinctByUid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension ContatoStorageModelQueryProperty
    on QueryBuilder<ContatoStorageModel, ContatoStorageModel, QQueryProperty> {
  QueryBuilder<ContatoStorageModel, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<ContatoStorageModel, bool?, QQueryOperations> ativoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ativo');
    });
  }

  QueryBuilder<ContatoStorageModel, DateTime?, QQueryOperations>
      atualizadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atualizadoEm');
    });
  }

  QueryBuilder<ContatoStorageModel, List<int>, QQueryOperations>
      categoriasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categorias');
    });
  }

  QueryBuilder<ContatoStorageModel, DateTime?, QQueryOperations>
      criadoEmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'criadoEm');
    });
  }

  QueryBuilder<ContatoStorageModel, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }

  QueryBuilder<ContatoStorageModel, List<String>, QQueryOperations>
      telefonesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'telefones');
    });
  }

  QueryBuilder<ContatoStorageModel, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
