// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_stats.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyStatsCollection on Isar {
  IsarCollection<DailyStats> get dailyStats => this.collection();
}

const DailyStatsSchema = CollectionSchema(
  name: r'DailyStats',
  id: -7592871651347013517,
  properties: {
    r'categoryKeys': PropertySchema(
      id: 0,
      name: r'categoryKeys',
      type: IsarType.stringList,
    ),
    r'categoryValues': PropertySchema(
      id: 1,
      name: r'categoryValues',
      type: IsarType.longList,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'questsCompleted': PropertySchema(
      id: 3,
      name: r'questsCompleted',
      type: IsarType.long,
    ),
    r'streakCount': PropertySchema(
      id: 4,
      name: r'streakCount',
      type: IsarType.long,
    ),
    r'titlesEarned': PropertySchema(
      id: 5,
      name: r'titlesEarned',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyStatsEstimateSize,
  serialize: _dailyStatsSerialize,
  deserialize: _dailyStatsDeserialize,
  deserializeProp: _dailyStatsDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _dailyStatsGetId,
  getLinks: _dailyStatsGetLinks,
  attach: _dailyStatsAttach,
  version: '3.1.0+1',
);

int _dailyStatsEstimateSize(
  DailyStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryKeys.length * 3;
  {
    for (var i = 0; i < object.categoryKeys.length; i++) {
      final value = object.categoryKeys[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.categoryValues.length * 8;
  return bytesCount;
}

void _dailyStatsSerialize(
  DailyStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.categoryKeys);
  writer.writeLongList(offsets[1], object.categoryValues);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeLong(offsets[3], object.questsCompleted);
  writer.writeLong(offsets[4], object.streakCount);
  writer.writeLong(offsets[5], object.titlesEarned);
}

DailyStats _dailyStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyStats();
  object.categoryKeys = reader.readStringList(offsets[0]) ?? [];
  object.categoryValues = reader.readLongList(offsets[1]) ?? [];
  object.date = reader.readDateTime(offsets[2]);
  object.id = id;
  object.questsCompleted = reader.readLong(offsets[3]);
  object.streakCount = reader.readLong(offsets[4]);
  object.titlesEarned = reader.readLong(offsets[5]);
  return object;
}

P _dailyStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readLongList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyStatsGetId(DailyStats object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyStatsGetLinks(DailyStats object) {
  return [];
}

void _dailyStatsAttach(IsarCollection<dynamic> col, Id id, DailyStats object) {
  object.id = id;
}

extension DailyStatsByIndex on IsarCollection<DailyStats> {
  Future<DailyStats?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  DailyStats? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<DailyStats?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<DailyStats?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(DailyStats object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(DailyStats object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<DailyStats> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(List<DailyStats> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension DailyStatsQueryWhereSort
    on QueryBuilder<DailyStats, DailyStats, QWhere> {
  QueryBuilder<DailyStats, DailyStats, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension DailyStatsQueryWhere
    on QueryBuilder<DailyStats, DailyStats, QWhereClause> {
  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> idBetween(
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

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyStatsQueryFilter
    on QueryBuilder<DailyStats, DailyStats, QFilterCondition> {
  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryKeys',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryKeys',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryKeys',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryKeys',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryKeys',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryKeys',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryKeys',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryKeys',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryKeys',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryKeys',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryKeysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryKeys',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryValues',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryValues',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryValues',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryValues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryValues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryValues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryValues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryValues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryValues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      categoryValuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryValues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      questsCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      questsCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      questsCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      questsCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questsCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      streakCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streakCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      streakCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streakCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      streakCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streakCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      streakCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streakCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      titlesEarnedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'titlesEarned',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      titlesEarnedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'titlesEarned',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      titlesEarnedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'titlesEarned',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterFilterCondition>
      titlesEarnedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'titlesEarned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyStatsQueryObject
    on QueryBuilder<DailyStats, DailyStats, QFilterCondition> {}

extension DailyStatsQueryLinks
    on QueryBuilder<DailyStats, DailyStats, QFilterCondition> {}

extension DailyStatsQuerySortBy
    on QueryBuilder<DailyStats, DailyStats, QSortBy> {
  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByQuestsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questsCompleted', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy>
      sortByQuestsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questsCompleted', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByStreakCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakCount', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByStreakCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakCount', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByTitlesEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlesEarned', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> sortByTitlesEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlesEarned', Sort.desc);
    });
  }
}

extension DailyStatsQuerySortThenBy
    on QueryBuilder<DailyStats, DailyStats, QSortThenBy> {
  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByQuestsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questsCompleted', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy>
      thenByQuestsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questsCompleted', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByStreakCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakCount', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByStreakCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakCount', Sort.desc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByTitlesEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlesEarned', Sort.asc);
    });
  }

  QueryBuilder<DailyStats, DailyStats, QAfterSortBy> thenByTitlesEarnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlesEarned', Sort.desc);
    });
  }
}

extension DailyStatsQueryWhereDistinct
    on QueryBuilder<DailyStats, DailyStats, QDistinct> {
  QueryBuilder<DailyStats, DailyStats, QDistinct> distinctByCategoryKeys() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryKeys');
    });
  }

  QueryBuilder<DailyStats, DailyStats, QDistinct> distinctByCategoryValues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryValues');
    });
  }

  QueryBuilder<DailyStats, DailyStats, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DailyStats, DailyStats, QDistinct> distinctByQuestsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questsCompleted');
    });
  }

  QueryBuilder<DailyStats, DailyStats, QDistinct> distinctByStreakCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakCount');
    });
  }

  QueryBuilder<DailyStats, DailyStats, QDistinct> distinctByTitlesEarned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titlesEarned');
    });
  }
}

extension DailyStatsQueryProperty
    on QueryBuilder<DailyStats, DailyStats, QQueryProperty> {
  QueryBuilder<DailyStats, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyStats, List<String>, QQueryOperations>
      categoryKeysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryKeys');
    });
  }

  QueryBuilder<DailyStats, List<int>, QQueryOperations>
      categoryValuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryValues');
    });
  }

  QueryBuilder<DailyStats, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailyStats, int, QQueryOperations> questsCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questsCompleted');
    });
  }

  QueryBuilder<DailyStats, int, QQueryOperations> streakCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakCount');
    });
  }

  QueryBuilder<DailyStats, int, QQueryOperations> titlesEarnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titlesEarned');
    });
  }
}
