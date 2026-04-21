// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestCollection on Isar {
  IsarCollection<Quest> get quests => this.collection();
}

const QuestSchema = CollectionSchema(
  name: r'Quest',
  id: 4554541312824334418,
  properties: {
    r'assignedAt': PropertySchema(
      id: 0,
      name: r'assignedAt',
      type: IsarType.dateTime,
    ),
    r'assignedByAltrr': PropertySchema(
      id: 1,
      name: r'assignedByAltrr',
      type: IsarType.bool,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'chainId': PropertySchema(
      id: 3,
      name: r'chainId',
      type: IsarType.string,
    ),
    r'chainStep': PropertySchema(
      id: 4,
      name: r'chainStep',
      type: IsarType.long,
    ),
    r'chainTotal': PropertySchema(
      id: 5,
      name: r'chainTotal',
      type: IsarType.long,
    ),
    r'characterId': PropertySchema(
      id: 6,
      name: r'characterId',
      type: IsarType.long,
    ),
    r'completedAt': PropertySchema(
      id: 7,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 8,
      name: r'description',
      type: IsarType.string,
    ),
    r'expiresAt': PropertySchema(
      id: 9,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'expiryDuration': PropertySchema(
      id: 10,
      name: r'expiryDuration',
      type: IsarType.long,
    ),
    r'hint': PropertySchema(
      id: 11,
      name: r'hint',
      type: IsarType.string,
    ),
    r'questNature': PropertySchema(
      id: 12,
      name: r'questNature',
      type: IsarType.string,
      enumMap: _QuestquestNatureEnumValueMap,
    ),
    r'questType': PropertySchema(
      id: 13,
      name: r'questType',
      type: IsarType.string,
      enumMap: _QuestquestTypeEnumValueMap,
    ),
    r'skippedAt': PropertySchema(
      id: 14,
      name: r'skippedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 15,
      name: r'status',
      type: IsarType.string,
      enumMap: _QueststatusEnumValueMap,
    ),
    r'submissionDifficulty': PropertySchema(
      id: 16,
      name: r'submissionDifficulty',
      type: IsarType.long,
    ),
    r'submissionEmotions': PropertySchema(
      id: 17,
      name: r'submissionEmotions',
      type: IsarType.stringList,
    ),
    r'submissionNote': PropertySchema(
      id: 18,
      name: r'submissionNote',
      type: IsarType.string,
    ),
    r'submissionPhotoPath': PropertySchema(
      id: 19,
      name: r'submissionPhotoPath',
      type: IsarType.string,
    ),
    r'submissionTimeSpent': PropertySchema(
      id: 20,
      name: r'submissionTimeSpent',
      type: IsarType.string,
    ),
    r'submissionWhere': PropertySchema(
      id: 21,
      name: r'submissionWhere',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 22,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _questEstimateSize,
  serialize: _questSerialize,
  deserialize: _questDeserialize,
  deserializeProp: _questDeserializeProp,
  idName: r'id',
  indexes: {
    r'category': IndexSchema(
      id: -7560358558326323820,
      name: r'category',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'category',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'assignedAt': IndexSchema(
      id: -6202192226478979906,
      name: r'assignedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'assignedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _questGetId,
  getLinks: _questGetLinks,
  attach: _questAttach,
  version: '3.1.0+1',
);

int _questEstimateSize(
  Quest object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.chainId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.hint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.questNature.name.length * 3;
  bytesCount += 3 + object.questType.name.length * 3;
  bytesCount += 3 + object.status.name.length * 3;
  bytesCount += 3 + object.submissionEmotions.length * 3;
  {
    for (var i = 0; i < object.submissionEmotions.length; i++) {
      final value = object.submissionEmotions[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.submissionNote;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.submissionPhotoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.submissionTimeSpent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.submissionWhere;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _questSerialize(
  Quest object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.assignedAt);
  writer.writeBool(offsets[1], object.assignedByAltrr);
  writer.writeString(offsets[2], object.category);
  writer.writeString(offsets[3], object.chainId);
  writer.writeLong(offsets[4], object.chainStep);
  writer.writeLong(offsets[5], object.chainTotal);
  writer.writeLong(offsets[6], object.characterId);
  writer.writeDateTime(offsets[7], object.completedAt);
  writer.writeString(offsets[8], object.description);
  writer.writeDateTime(offsets[9], object.expiresAt);
  writer.writeLong(offsets[10], object.expiryDuration);
  writer.writeString(offsets[11], object.hint);
  writer.writeString(offsets[12], object.questNature.name);
  writer.writeString(offsets[13], object.questType.name);
  writer.writeDateTime(offsets[14], object.skippedAt);
  writer.writeString(offsets[15], object.status.name);
  writer.writeLong(offsets[16], object.submissionDifficulty);
  writer.writeStringList(offsets[17], object.submissionEmotions);
  writer.writeString(offsets[18], object.submissionNote);
  writer.writeString(offsets[19], object.submissionPhotoPath);
  writer.writeString(offsets[20], object.submissionTimeSpent);
  writer.writeString(offsets[21], object.submissionWhere);
  writer.writeString(offsets[22], object.title);
}

Quest _questDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Quest();
  object.assignedAt = reader.readDateTime(offsets[0]);
  object.assignedByAltrr = reader.readBool(offsets[1]);
  object.category = reader.readString(offsets[2]);
  object.chainId = reader.readStringOrNull(offsets[3]);
  object.chainStep = reader.readLongOrNull(offsets[4]);
  object.chainTotal = reader.readLongOrNull(offsets[5]);
  object.characterId = reader.readLongOrNull(offsets[6]);
  object.completedAt = reader.readDateTimeOrNull(offsets[7]);
  object.description = reader.readString(offsets[8]);
  object.expiresAt = reader.readDateTime(offsets[9]);
  object.expiryDuration = reader.readLong(offsets[10]);
  object.hint = reader.readStringOrNull(offsets[11]);
  object.id = id;
  object.questNature =
      _QuestquestNatureValueEnumMap[reader.readStringOrNull(offsets[12])] ??
          QuestNature.action;
  object.questType =
      _QuestquestTypeValueEnumMap[reader.readStringOrNull(offsets[13])] ??
          QuestType.daily;
  object.skippedAt = reader.readDateTimeOrNull(offsets[14]);
  object.status =
      _QueststatusValueEnumMap[reader.readStringOrNull(offsets[15])] ??
          QuestStatus.active;
  object.submissionDifficulty = reader.readLongOrNull(offsets[16]);
  object.submissionEmotions = reader.readStringList(offsets[17]) ?? [];
  object.submissionNote = reader.readStringOrNull(offsets[18]);
  object.submissionPhotoPath = reader.readStringOrNull(offsets[19]);
  object.submissionTimeSpent = reader.readStringOrNull(offsets[20]);
  object.submissionWhere = reader.readStringOrNull(offsets[21]);
  object.title = reader.readString(offsets[22]);
  return object;
}

P _questDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (_QuestquestNatureValueEnumMap[reader.readStringOrNull(offset)] ??
          QuestNature.action) as P;
    case 13:
      return (_QuestquestTypeValueEnumMap[reader.readStringOrNull(offset)] ??
          QuestType.daily) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (_QueststatusValueEnumMap[reader.readStringOrNull(offset)] ??
          QuestStatus.active) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readStringList(offset) ?? []) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _QuestquestNatureEnumValueMap = {
  r'action': r'action',
  r'social': r'social',
  r'creative': r'creative',
  r'explore': r'explore',
};
const _QuestquestNatureValueEnumMap = {
  r'action': QuestNature.action,
  r'social': QuestNature.social,
  r'creative': QuestNature.creative,
  r'explore': QuestNature.explore,
};
const _QuestquestTypeEnumValueMap = {
  r'daily': r'daily',
  r'chain': r'chain',
  r'challenge': r'challenge',
};
const _QuestquestTypeValueEnumMap = {
  r'daily': QuestType.daily,
  r'chain': QuestType.chain,
  r'challenge': QuestType.challenge,
};
const _QueststatusEnumValueMap = {
  r'active': r'active',
  r'completed': r'completed',
  r'skipped': r'skipped',
};
const _QueststatusValueEnumMap = {
  r'active': QuestStatus.active,
  r'completed': QuestStatus.completed,
  r'skipped': QuestStatus.skipped,
};

Id _questGetId(Quest object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questGetLinks(Quest object) {
  return [];
}

void _questAttach(IsarCollection<dynamic> col, Id id, Quest object) {
  object.id = id;
}

extension QuestQueryWhereSort on QueryBuilder<Quest, Quest, QWhere> {
  QueryBuilder<Quest, Quest, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhere> anyAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'assignedAt'),
      );
    });
  }
}

extension QuestQueryWhere on QueryBuilder<Quest, Quest, QWhereClause> {
  QueryBuilder<Quest, Quest, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Quest, Quest, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> idBetween(
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

  QueryBuilder<Quest, Quest, QAfterWhereClause> categoryEqualTo(
      String category) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'category',
        value: [category],
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> categoryNotEqualTo(
      String category) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [],
              upper: [category],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [category],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [category],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category',
              lower: [],
              upper: [category],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> assignedAtEqualTo(
      DateTime assignedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedAt',
        value: [assignedAt],
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> assignedAtNotEqualTo(
      DateTime assignedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedAt',
              lower: [],
              upper: [assignedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedAt',
              lower: [assignedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedAt',
              lower: [assignedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedAt',
              lower: [],
              upper: [assignedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> assignedAtGreaterThan(
    DateTime assignedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedAt',
        lower: [assignedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> assignedAtLessThan(
    DateTime assignedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedAt',
        lower: [],
        upper: [assignedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterWhereClause> assignedAtBetween(
    DateTime lowerAssignedAt,
    DateTime upperAssignedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedAt',
        lower: [lowerAssignedAt],
        includeLower: includeLower,
        upper: [upperAssignedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestQueryFilter on QueryBuilder<Quest, Quest, QFilterCondition> {
  QueryBuilder<Quest, Quest, QAfterFilterCondition> assignedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> assignedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> assignedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> assignedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> assignedByAltrrEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedByAltrr',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryEqualTo(
    String value, {
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryGreaterThan(
    String value, {
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryLessThan(
    String value, {
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryStartsWith(
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryEndsWith(
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryMatches(
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chainId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chainId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainStepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainStep',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainStepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainStep',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainStepEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainStep',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainStepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chainStep',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainStepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chainStep',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainStepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chainStep',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainTotalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainTotal',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainTotalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainTotal',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainTotalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainTotalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chainTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainTotalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chainTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> chainTotalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chainTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> characterIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'characterId',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> characterIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'characterId',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> characterIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> characterIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> characterIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> characterIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'characterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> completedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiresAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiresAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiresAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiresAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiryDurationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiryDurationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiryDurationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> expiryDurationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hint',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hint',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> hintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hint',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureEqualTo(
    QuestNature value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questNature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureGreaterThan(
    QuestNature value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questNature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureLessThan(
    QuestNature value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questNature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureBetween(
    QuestNature lower,
    QuestNature upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questNature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questNature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questNature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questNature',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questNature',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questNature',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questNatureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questNature',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeEqualTo(
    QuestType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeGreaterThan(
    QuestType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeLessThan(
    QuestType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeBetween(
    QuestType lower,
    QuestType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questType',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> questTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questType',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> skippedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skippedAt',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> skippedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skippedAt',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> skippedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skippedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> skippedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skippedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> skippedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skippedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> skippedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skippedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusEqualTo(
    QuestStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusGreaterThan(
    QuestStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusLessThan(
    QuestStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusBetween(
    QuestStatus lower,
    QuestStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionDifficultyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submissionDifficulty',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionDifficultyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submissionDifficulty',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionDifficultyEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionDifficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionDifficultyGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submissionDifficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionDifficultyLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submissionDifficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionDifficultyBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submissionDifficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionEmotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submissionEmotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submissionEmotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submissionEmotions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'submissionEmotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'submissionEmotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'submissionEmotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'submissionEmotions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionEmotions',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'submissionEmotions',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'submissionEmotions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'submissionEmotions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'submissionEmotions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'submissionEmotions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'submissionEmotions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionEmotionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'submissionEmotions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submissionNote',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submissionNote',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submissionNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submissionNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submissionNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'submissionNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'submissionNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'submissionNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'submissionNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionNote',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'submissionNote',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionPhotoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submissionPhotoPath',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionPhotoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submissionPhotoPath',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionPhotoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionPhotoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionPhotoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submissionPhotoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionPhotoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submissionPhotoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionPhotoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submissionPhotoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionPhotoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'submissionPhotoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionPhotoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'submissionPhotoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionPhotoPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'submissionPhotoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionPhotoPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'submissionPhotoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionPhotoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionPhotoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionPhotoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'submissionPhotoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionTimeSpentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submissionTimeSpent',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionTimeSpentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submissionTimeSpent',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionTimeSpentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionTimeSpent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionTimeSpentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submissionTimeSpent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionTimeSpentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submissionTimeSpent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionTimeSpentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submissionTimeSpent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionTimeSpentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'submissionTimeSpent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionTimeSpentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'submissionTimeSpent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionTimeSpentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'submissionTimeSpent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionTimeSpentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'submissionTimeSpent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionTimeSpentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionTimeSpent',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionTimeSpentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'submissionTimeSpent',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'submissionWhere',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'submissionWhere',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionWhere',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'submissionWhere',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'submissionWhere',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'submissionWhere',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'submissionWhere',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'submissionWhere',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'submissionWhere',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'submissionWhere',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> submissionWhereIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'submissionWhere',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition>
      submissionWhereIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'submissionWhere',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Quest, Quest, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension QuestQueryObject on QueryBuilder<Quest, Quest, QFilterCondition> {}

extension QuestQueryLinks on QueryBuilder<Quest, Quest, QFilterCondition> {}

extension QuestQuerySortBy on QueryBuilder<Quest, Quest, QSortBy> {
  QueryBuilder<Quest, Quest, QAfterSortBy> sortByAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByAssignedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByAssignedByAltrr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByAltrr', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByAssignedByAltrrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByAltrr', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByChainIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByChainStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainStep', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByChainStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainStep', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByChainTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainTotal', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByChainTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainTotal', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByExpiryDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDuration', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByExpiryDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDuration', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByHint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByHintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByQuestNature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questNature', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByQuestNatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questNature', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByQuestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questType', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByQuestTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questType', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySkippedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySkippedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionDifficulty', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionDifficulty', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionNote', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionNote', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionPhotoPath', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionPhotoPath', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionTimeSpent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionTimeSpent', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionTimeSpentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionTimeSpent', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionWhere() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionWhere', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortBySubmissionWhereDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionWhere', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension QuestQuerySortThenBy on QueryBuilder<Quest, Quest, QSortThenBy> {
  QueryBuilder<Quest, Quest, QAfterSortBy> thenByAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByAssignedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByAssignedByAltrr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByAltrr', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByAssignedByAltrrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByAltrr', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByChainIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByChainStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainStep', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByChainStepDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainStep', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByChainTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainTotal', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByChainTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainTotal', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByExpiryDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDuration', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByExpiryDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDuration', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByHint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByHintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByQuestNature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questNature', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByQuestNatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questNature', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByQuestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questType', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByQuestTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questType', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySkippedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedAt', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySkippedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skippedAt', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionDifficulty', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionDifficulty', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionNote', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionNote', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionPhotoPath', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionPhotoPath', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionTimeSpent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionTimeSpent', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionTimeSpentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionTimeSpent', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionWhere() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionWhere', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenBySubmissionWhereDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'submissionWhere', Sort.desc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Quest, Quest, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension QuestQueryWhereDistinct on QueryBuilder<Quest, Quest, QDistinct> {
  QueryBuilder<Quest, Quest, QDistinct> distinctByAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedAt');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByAssignedByAltrr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedByAltrr');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByChainId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByChainStep() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainStep');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByChainTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainTotal');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterId');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByExpiryDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDuration');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByQuestNature(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questNature', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByQuestType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySkippedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skippedAt');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySubmissionDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submissionDifficulty');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySubmissionEmotions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submissionEmotions');
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySubmissionNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submissionNote',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySubmissionPhotoPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submissionPhotoPath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySubmissionTimeSpent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submissionTimeSpent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctBySubmissionWhere(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'submissionWhere',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Quest, Quest, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension QuestQueryProperty on QueryBuilder<Quest, Quest, QQueryProperty> {
  QueryBuilder<Quest, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Quest, DateTime, QQueryOperations> assignedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedAt');
    });
  }

  QueryBuilder<Quest, bool, QQueryOperations> assignedByAltrrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedByAltrr');
    });
  }

  QueryBuilder<Quest, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<Quest, String?, QQueryOperations> chainIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainId');
    });
  }

  QueryBuilder<Quest, int?, QQueryOperations> chainStepProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainStep');
    });
  }

  QueryBuilder<Quest, int?, QQueryOperations> chainTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainTotal');
    });
  }

  QueryBuilder<Quest, int?, QQueryOperations> characterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterId');
    });
  }

  QueryBuilder<Quest, DateTime?, QQueryOperations> completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<Quest, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Quest, DateTime, QQueryOperations> expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<Quest, int, QQueryOperations> expiryDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDuration');
    });
  }

  QueryBuilder<Quest, String?, QQueryOperations> hintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hint');
    });
  }

  QueryBuilder<Quest, QuestNature, QQueryOperations> questNatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questNature');
    });
  }

  QueryBuilder<Quest, QuestType, QQueryOperations> questTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questType');
    });
  }

  QueryBuilder<Quest, DateTime?, QQueryOperations> skippedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skippedAt');
    });
  }

  QueryBuilder<Quest, QuestStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Quest, int?, QQueryOperations> submissionDifficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submissionDifficulty');
    });
  }

  QueryBuilder<Quest, List<String>, QQueryOperations>
      submissionEmotionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submissionEmotions');
    });
  }

  QueryBuilder<Quest, String?, QQueryOperations> submissionNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submissionNote');
    });
  }

  QueryBuilder<Quest, String?, QQueryOperations> submissionPhotoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submissionPhotoPath');
    });
  }

  QueryBuilder<Quest, String?, QQueryOperations> submissionTimeSpentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submissionTimeSpent');
    });
  }

  QueryBuilder<Quest, String?, QQueryOperations> submissionWhereProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'submissionWhere');
    });
  }

  QueryBuilder<Quest, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
