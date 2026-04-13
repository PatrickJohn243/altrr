// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earned_title.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEarnedTitleCollection on Isar {
  IsarCollection<EarnedTitle> get earnedTitles => this.collection();
}

const EarnedTitleSchema = CollectionSchema(
  name: r'EarnedTitle',
  id: 1512985048060375248,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'condition': PropertySchema(
      id: 1,
      name: r'condition',
      type: IsarType.string,
      enumMap: _EarnedTitleconditionEnumValueMap,
    ),
    r'conditionTag': PropertySchema(
      id: 2,
      name: r'conditionTag',
      type: IsarType.string,
    ),
    r'earnedAt': PropertySchema(
      id: 3,
      name: r'earnedAt',
      type: IsarType.dateTime,
    ),
    r'gachaSubtext': PropertySchema(
      id: 4,
      name: r'gachaSubtext',
      type: IsarType.string,
    ),
    r'isSeen': PropertySchema(
      id: 5,
      name: r'isSeen',
      type: IsarType.bool,
    ),
    r'subtextA': PropertySchema(
      id: 6,
      name: r'subtextA',
      type: IsarType.string,
    ),
    r'subtextB': PropertySchema(
      id: 7,
      name: r'subtextB',
      type: IsarType.string,
    ),
    r'tier': PropertySchema(
      id: 8,
      name: r'tier',
      type: IsarType.long,
    ),
    r'titleText': PropertySchema(
      id: 9,
      name: r'titleText',
      type: IsarType.string,
    ),
    r'titleType': PropertySchema(
      id: 10,
      name: r'titleType',
      type: IsarType.string,
      enumMap: _EarnedTitletitleTypeEnumValueMap,
    )
  },
  estimateSize: _earnedTitleEstimateSize,
  serialize: _earnedTitleSerialize,
  deserialize: _earnedTitleDeserialize,
  deserializeProp: _earnedTitleDeserializeProp,
  idName: r'id',
  indexes: {
    r'earnedAt': IndexSchema(
      id: -8281250366239188956,
      name: r'earnedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'earnedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _earnedTitleGetId,
  getLinks: _earnedTitleGetLinks,
  attach: _earnedTitleAttach,
  version: '3.1.0+1',
);

int _earnedTitleEstimateSize(
  EarnedTitle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.condition.name.length * 3;
  {
    final value = object.conditionTag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gachaSubtext;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subtextA;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subtextB;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.titleText.length * 3;
  bytesCount += 3 + object.titleType.name.length * 3;
  return bytesCount;
}

void _earnedTitleSerialize(
  EarnedTitle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeString(offsets[1], object.condition.name);
  writer.writeString(offsets[2], object.conditionTag);
  writer.writeDateTime(offsets[3], object.earnedAt);
  writer.writeString(offsets[4], object.gachaSubtext);
  writer.writeBool(offsets[5], object.isSeen);
  writer.writeString(offsets[6], object.subtextA);
  writer.writeString(offsets[7], object.subtextB);
  writer.writeLong(offsets[8], object.tier);
  writer.writeString(offsets[9], object.titleText);
  writer.writeString(offsets[10], object.titleType.name);
}

EarnedTitle _earnedTitleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EarnedTitle();
  object.category = reader.readStringOrNull(offsets[0]);
  object.condition =
      _EarnedTitleconditionValueEnumMap[reader.readStringOrNull(offsets[1])] ??
          TitleCondition.questCount;
  object.conditionTag = reader.readStringOrNull(offsets[2]);
  object.earnedAt = reader.readDateTime(offsets[3]);
  object.gachaSubtext = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.isSeen = reader.readBool(offsets[5]);
  object.subtextA = reader.readStringOrNull(offsets[6]);
  object.subtextB = reader.readStringOrNull(offsets[7]);
  object.tier = reader.readLongOrNull(offsets[8]);
  object.titleText = reader.readString(offsets[9]);
  object.titleType =
      _EarnedTitletitleTypeValueEnumMap[reader.readStringOrNull(offsets[10])] ??
          TitleType.factored;
  return object;
}

P _earnedTitleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_EarnedTitleconditionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TitleCondition.questCount) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_EarnedTitletitleTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TitleType.factored) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EarnedTitleconditionEnumValueMap = {
  r'questCount': r'questCount',
  r'timeBased': r'timeBased',
  r'gacha': r'gacha',
};
const _EarnedTitleconditionValueEnumMap = {
  r'questCount': TitleCondition.questCount,
  r'timeBased': TitleCondition.timeBased,
  r'gacha': TitleCondition.gacha,
};
const _EarnedTitletitleTypeEnumValueMap = {
  r'factored': r'factored',
  r'gacha': r'gacha',
};
const _EarnedTitletitleTypeValueEnumMap = {
  r'factored': TitleType.factored,
  r'gacha': TitleType.gacha,
};

Id _earnedTitleGetId(EarnedTitle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _earnedTitleGetLinks(EarnedTitle object) {
  return [];
}

void _earnedTitleAttach(
    IsarCollection<dynamic> col, Id id, EarnedTitle object) {
  object.id = id;
}

extension EarnedTitleQueryWhereSort
    on QueryBuilder<EarnedTitle, EarnedTitle, QWhere> {
  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhere> anyEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'earnedAt'),
      );
    });
  }
}

extension EarnedTitleQueryWhere
    on QueryBuilder<EarnedTitle, EarnedTitle, QWhereClause> {
  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> idBetween(
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

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> earnedAtEqualTo(
      DateTime earnedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'earnedAt',
        value: [earnedAt],
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> earnedAtNotEqualTo(
      DateTime earnedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'earnedAt',
              lower: [],
              upper: [earnedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'earnedAt',
              lower: [earnedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'earnedAt',
              lower: [earnedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'earnedAt',
              lower: [],
              upper: [earnedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> earnedAtGreaterThan(
    DateTime earnedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'earnedAt',
        lower: [earnedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> earnedAtLessThan(
    DateTime earnedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'earnedAt',
        lower: [],
        upper: [earnedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterWhereClause> earnedAtBetween(
    DateTime lowerEarnedAt,
    DateTime upperEarnedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'earnedAt',
        lower: [lowerEarnedAt],
        includeLower: includeLower,
        upper: [upperEarnedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EarnedTitleQueryFilter
    on QueryBuilder<EarnedTitle, EarnedTitle, QFilterCondition> {
  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionEqualTo(
    TitleCondition value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionGreaterThan(
    TitleCondition value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionLessThan(
    TitleCondition value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionBetween(
    TitleCondition lower,
    TitleCondition upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'condition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'condition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'condition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'condition',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conditionTag',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conditionTag',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conditionTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conditionTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conditionTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conditionTag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conditionTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conditionTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conditionTag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conditionTag',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conditionTag',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      conditionTagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conditionTag',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> earnedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      earnedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      earnedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earnedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> earnedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earnedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gachaSubtext',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gachaSubtext',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gachaSubtext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gachaSubtext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gachaSubtext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gachaSubtext',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gachaSubtext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gachaSubtext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gachaSubtext',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gachaSubtext',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gachaSubtext',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      gachaSubtextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gachaSubtext',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> isSeenEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subtextA',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subtextA',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> subtextAEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtextA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtextA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextALessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtextA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> subtextABetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtextA',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtextA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtextA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtextA',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> subtextAMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtextA',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtextA',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextAIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtextA',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subtextB',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subtextB',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> subtextBEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtextB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtextB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtextB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> subtextBBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtextB',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtextB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtextB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtextB',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> subtextBMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtextB',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtextB',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      subtextBIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtextB',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> tierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tier',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      tierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tier',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> tierEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tier',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> tierGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tier',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> tierLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tier',
        value: value,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition> tierBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleText',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleText',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeEqualTo(
    TitleType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeGreaterThan(
    TitleType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeLessThan(
    TitleType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeBetween(
    TitleType lower,
    TitleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'titleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'titleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'titleType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'titleType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titleType',
        value: '',
      ));
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterFilterCondition>
      titleTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'titleType',
        value: '',
      ));
    });
  }
}

extension EarnedTitleQueryObject
    on QueryBuilder<EarnedTitle, EarnedTitle, QFilterCondition> {}

extension EarnedTitleQueryLinks
    on QueryBuilder<EarnedTitle, EarnedTitle, QFilterCondition> {}

extension EarnedTitleQuerySortBy
    on QueryBuilder<EarnedTitle, EarnedTitle, QSortBy> {
  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByConditionTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionTag', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy>
      sortByConditionTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionTag', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByEarnedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByGachaSubtext() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gachaSubtext', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy>
      sortByGachaSubtextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gachaSubtext', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByIsSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByIsSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortBySubtextA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextA', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortBySubtextADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextA', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortBySubtextB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextB', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortBySubtextBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextB', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByTitleText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleText', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByTitleTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleText', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByTitleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleType', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> sortByTitleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleType', Sort.desc);
    });
  }
}

extension EarnedTitleQuerySortThenBy
    on QueryBuilder<EarnedTitle, EarnedTitle, QSortThenBy> {
  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'condition', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByConditionTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionTag', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy>
      thenByConditionTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conditionTag', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByEarnedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedAt', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByGachaSubtext() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gachaSubtext', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy>
      thenByGachaSubtextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gachaSubtext', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByIsSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByIsSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenBySubtextA() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextA', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenBySubtextADesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextA', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenBySubtextB() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextB', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenBySubtextBDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtextB', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tier', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByTitleText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleText', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByTitleTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleText', Sort.desc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByTitleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleType', Sort.asc);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QAfterSortBy> thenByTitleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleType', Sort.desc);
    });
  }
}

extension EarnedTitleQueryWhereDistinct
    on QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> {
  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByCondition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'condition', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByConditionTag(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conditionTag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByEarnedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'earnedAt');
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByGachaSubtext(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gachaSubtext', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByIsSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSeen');
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctBySubtextA(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtextA', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctBySubtextB(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtextB', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tier');
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByTitleText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EarnedTitle, EarnedTitle, QDistinct> distinctByTitleType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleType', caseSensitive: caseSensitive);
    });
  }
}

extension EarnedTitleQueryProperty
    on QueryBuilder<EarnedTitle, EarnedTitle, QQueryProperty> {
  QueryBuilder<EarnedTitle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EarnedTitle, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<EarnedTitle, TitleCondition, QQueryOperations>
      conditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'condition');
    });
  }

  QueryBuilder<EarnedTitle, String?, QQueryOperations> conditionTagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conditionTag');
    });
  }

  QueryBuilder<EarnedTitle, DateTime, QQueryOperations> earnedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earnedAt');
    });
  }

  QueryBuilder<EarnedTitle, String?, QQueryOperations> gachaSubtextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gachaSubtext');
    });
  }

  QueryBuilder<EarnedTitle, bool, QQueryOperations> isSeenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSeen');
    });
  }

  QueryBuilder<EarnedTitle, String?, QQueryOperations> subtextAProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtextA');
    });
  }

  QueryBuilder<EarnedTitle, String?, QQueryOperations> subtextBProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtextB');
    });
  }

  QueryBuilder<EarnedTitle, int?, QQueryOperations> tierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tier');
    });
  }

  QueryBuilder<EarnedTitle, String, QQueryOperations> titleTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleText');
    });
  }

  QueryBuilder<EarnedTitle, TitleType, QQueryOperations> titleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleType');
    });
  }
}
