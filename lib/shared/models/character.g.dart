// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCharacterCollection on Isar {
  IsarCollection<Character> get characters => this.collection();
}

const CharacterSchema = CollectionSchema(
  name: r'Character',
  id: 4658184409279959047,
  properties: {
    r'archetype': PropertySchema(
      id: 0,
      name: r'archetype',
      type: IsarType.string,
      enumMap: _CharacterarchetypeEnumValueMap,
    ),
    r'domainWeights': PropertySchema(
      id: 1,
      name: r'domainWeights',
      type: IsarType.doubleList,
    ),
    r'domains': PropertySchema(
      id: 2,
      name: r'domains',
      type: IsarType.stringList,
    ),
    r'epithet': PropertySchema(
      id: 3,
      name: r'epithet',
      type: IsarType.string,
    ),
    r'generationSeed': PropertySchema(
      id: 4,
      name: r'generationSeed',
      type: IsarType.long,
    ),
    r'intensity': PropertySchema(
      id: 5,
      name: r'intensity',
      type: IsarType.string,
      enumMap: _CharacterintensityEnumValueMap,
    ),
    r'isActive': PropertySchema(
      id: 6,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'rarity': PropertySchema(
      id: 8,
      name: r'rarity',
      type: IsarType.string,
      enumMap: _CharacterrarityEnumValueMap,
    ),
    r'tone': PropertySchema(
      id: 9,
      name: r'tone',
      type: IsarType.string,
      enumMap: _CharactertoneEnumValueMap,
    ),
    r'traitTags': PropertySchema(
      id: 10,
      name: r'traitTags',
      type: IsarType.stringList,
    ),
    r'unlockedAt': PropertySchema(
      id: 11,
      name: r'unlockedAt',
      type: IsarType.dateTime,
    ),
    r'verbosity': PropertySchema(
      id: 12,
      name: r'verbosity',
      type: IsarType.string,
      enumMap: _CharacterverbosityEnumValueMap,
    ),
    r'voice': PropertySchema(
      id: 13,
      name: r'voice',
      type: IsarType.string,
      enumMap: _CharactervoiceEnumValueMap,
    )
  },
  estimateSize: _characterEstimateSize,
  serialize: _characterSerialize,
  deserialize: _characterDeserialize,
  deserializeProp: _characterDeserializeProp,
  idName: r'id',
  indexes: {
    r'unlockedAt': IndexSchema(
      id: -2486051207984852976,
      name: r'unlockedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'unlockedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _characterGetId,
  getLinks: _characterGetLinks,
  attach: _characterAttach,
  version: '3.1.0+1',
);

int _characterEstimateSize(
  Character object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.archetype.name.length * 3;
  bytesCount += 3 + object.domainWeights.length * 8;
  bytesCount += 3 + object.domains.length * 3;
  {
    for (var i = 0; i < object.domains.length; i++) {
      final value = object.domains[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.epithet.length * 3;
  bytesCount += 3 + object.intensity.name.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.rarity.name.length * 3;
  bytesCount += 3 + object.tone.name.length * 3;
  bytesCount += 3 + object.traitTags.length * 3;
  {
    for (var i = 0; i < object.traitTags.length; i++) {
      final value = object.traitTags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.verbosity.name.length * 3;
  bytesCount += 3 + object.voice.name.length * 3;
  return bytesCount;
}

void _characterSerialize(
  Character object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.archetype.name);
  writer.writeDoubleList(offsets[1], object.domainWeights);
  writer.writeStringList(offsets[2], object.domains);
  writer.writeString(offsets[3], object.epithet);
  writer.writeLong(offsets[4], object.generationSeed);
  writer.writeString(offsets[5], object.intensity.name);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeString(offsets[7], object.name);
  writer.writeString(offsets[8], object.rarity.name);
  writer.writeString(offsets[9], object.tone.name);
  writer.writeStringList(offsets[10], object.traitTags);
  writer.writeDateTime(offsets[11], object.unlockedAt);
  writer.writeString(offsets[12], object.verbosity.name);
  writer.writeString(offsets[13], object.voice.name);
}

Character _characterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Character();
  object.archetype =
      _CharacterarchetypeValueEnumMap[reader.readStringOrNull(offsets[0])] ??
          CharacterArchetype.mentor;
  object.domainWeights = reader.readDoubleList(offsets[1]) ?? [];
  object.domains = reader.readStringList(offsets[2]) ?? [];
  object.epithet = reader.readString(offsets[3]);
  object.generationSeed = reader.readLong(offsets[4]);
  object.id = id;
  object.intensity =
      _CharacterintensityValueEnumMap[reader.readStringOrNull(offsets[5])] ??
          CharacterIntensity.gentle;
  object.isActive = reader.readBool(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.rarity =
      _CharacterrarityValueEnumMap[reader.readStringOrNull(offsets[8])] ??
          CharacterRarity.common;
  object.tone =
      _CharactertoneValueEnumMap[reader.readStringOrNull(offsets[9])] ??
          CharacterTone.stoic;
  object.traitTags = reader.readStringList(offsets[10]) ?? [];
  object.unlockedAt = reader.readDateTime(offsets[11]);
  object.verbosity =
      _CharacterverbosityValueEnumMap[reader.readStringOrNull(offsets[12])] ??
          CharacterVerbosity.brief;
  object.voice =
      _CharactervoiceValueEnumMap[reader.readStringOrNull(offsets[13])] ??
          CharacterVoice.firstPerson;
  return object;
}

P _characterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_CharacterarchetypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          CharacterArchetype.mentor) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_CharacterintensityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          CharacterIntensity.gentle) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_CharacterrarityValueEnumMap[reader.readStringOrNull(offset)] ??
          CharacterRarity.common) as P;
    case 9:
      return (_CharactertoneValueEnumMap[reader.readStringOrNull(offset)] ??
          CharacterTone.stoic) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (_CharacterverbosityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          CharacterVerbosity.brief) as P;
    case 13:
      return (_CharactervoiceValueEnumMap[reader.readStringOrNull(offset)] ??
          CharacterVoice.firstPerson) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CharacterarchetypeEnumValueMap = {
  r'mentor': r'mentor',
  r'trickster': r'trickster',
  r'sage': r'sage',
  r'warrior': r'warrior',
  r'explorer': r'explorer',
  r'scholar': r'scholar',
  r'caretaker': r'caretaker',
  r'rogue': r'rogue',
};
const _CharacterarchetypeValueEnumMap = {
  r'mentor': CharacterArchetype.mentor,
  r'trickster': CharacterArchetype.trickster,
  r'sage': CharacterArchetype.sage,
  r'warrior': CharacterArchetype.warrior,
  r'explorer': CharacterArchetype.explorer,
  r'scholar': CharacterArchetype.scholar,
  r'caretaker': CharacterArchetype.caretaker,
  r'rogue': CharacterArchetype.rogue,
};
const _CharacterintensityEnumValueMap = {
  r'gentle': r'gentle',
  r'moderate': r'moderate',
  r'demanding': r'demanding',
  r'ruthless': r'ruthless',
};
const _CharacterintensityValueEnumMap = {
  r'gentle': CharacterIntensity.gentle,
  r'moderate': CharacterIntensity.moderate,
  r'demanding': CharacterIntensity.demanding,
  r'ruthless': CharacterIntensity.ruthless,
};
const _CharacterrarityEnumValueMap = {
  r'common': r'common',
  r'uncommon': r'uncommon',
  r'rare': r'rare',
  r'legendary': r'legendary',
};
const _CharacterrarityValueEnumMap = {
  r'common': CharacterRarity.common,
  r'uncommon': CharacterRarity.uncommon,
  r'rare': CharacterRarity.rare,
  r'legendary': CharacterRarity.legendary,
};
const _CharactertoneEnumValueMap = {
  r'stoic': r'stoic',
  r'warm': r'warm',
  r'cryptic': r'cryptic',
  r'blunt': r'blunt',
  r'poetic': r'poetic',
  r'playful': r'playful',
  r'solemn': r'solemn',
};
const _CharactertoneValueEnumMap = {
  r'stoic': CharacterTone.stoic,
  r'warm': CharacterTone.warm,
  r'cryptic': CharacterTone.cryptic,
  r'blunt': CharacterTone.blunt,
  r'poetic': CharacterTone.poetic,
  r'playful': CharacterTone.playful,
  r'solemn': CharacterTone.solemn,
};
const _CharacterverbosityEnumValueMap = {
  r'brief': r'brief',
  r'moderate': r'moderate',
  r'elaborate': r'elaborate',
};
const _CharacterverbosityValueEnumMap = {
  r'brief': CharacterVerbosity.brief,
  r'moderate': CharacterVerbosity.moderate,
  r'elaborate': CharacterVerbosity.elaborate,
};
const _CharactervoiceEnumValueMap = {
  r'firstPerson': r'firstPerson',
  r'secondPerson': r'secondPerson',
  r'narrator': r'narrator',
  r'riddle': r'riddle',
};
const _CharactervoiceValueEnumMap = {
  r'firstPerson': CharacterVoice.firstPerson,
  r'secondPerson': CharacterVoice.secondPerson,
  r'narrator': CharacterVoice.narrator,
  r'riddle': CharacterVoice.riddle,
};

Id _characterGetId(Character object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _characterGetLinks(Character object) {
  return [];
}

void _characterAttach(IsarCollection<dynamic> col, Id id, Character object) {
  object.id = id;
}

extension CharacterQueryWhereSort
    on QueryBuilder<Character, Character, QWhere> {
  QueryBuilder<Character, Character, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Character, Character, QAfterWhere> anyUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'unlockedAt'),
      );
    });
  }
}

extension CharacterQueryWhere
    on QueryBuilder<Character, Character, QWhereClause> {
  QueryBuilder<Character, Character, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Character, Character, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idBetween(
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

  QueryBuilder<Character, Character, QAfterWhereClause> unlockedAtEqualTo(
      DateTime unlockedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'unlockedAt',
        value: [unlockedAt],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> unlockedAtNotEqualTo(
      DateTime unlockedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unlockedAt',
              lower: [],
              upper: [unlockedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unlockedAt',
              lower: [unlockedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unlockedAt',
              lower: [unlockedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'unlockedAt',
              lower: [],
              upper: [unlockedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> unlockedAtGreaterThan(
    DateTime unlockedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'unlockedAt',
        lower: [unlockedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> unlockedAtLessThan(
    DateTime unlockedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'unlockedAt',
        lower: [],
        upper: [unlockedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> unlockedAtBetween(
    DateTime lowerUnlockedAt,
    DateTime upperUnlockedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'unlockedAt',
        lower: [lowerUnlockedAt],
        includeLower: includeLower,
        upper: [upperUnlockedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CharacterQueryFilter
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeEqualTo(
    CharacterArchetype value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'archetype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      archetypeGreaterThan(
    CharacterArchetype value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'archetype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeLessThan(
    CharacterArchetype value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'archetype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeBetween(
    CharacterArchetype lower,
    CharacterArchetype upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'archetype',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'archetype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'archetype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'archetype',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'archetype',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> archetypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'archetype',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      archetypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'archetype',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domainWeights',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'domainWeights',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'domainWeights',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'domainWeights',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domainWeights',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domainWeights',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domainWeights',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domainWeights',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domainWeights',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainWeightsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domainWeights',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'domains',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'domains',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'domains',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'domains',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'domains',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> domainsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      domainsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'domains',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epithet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'epithet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'epithet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'epithet',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'epithet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'epithet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'epithet',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'epithet',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> epithetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epithet',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      epithetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'epithet',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      generationSeedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generationSeed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      generationSeedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generationSeed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      generationSeedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generationSeed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      generationSeedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generationSeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityEqualTo(
    CharacterIntensity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      intensityGreaterThan(
    CharacterIntensity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityLessThan(
    CharacterIntensity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityBetween(
    CharacterIntensity lower,
    CharacterIntensity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'intensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'intensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'intensity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'intensity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> intensityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intensity',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      intensityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'intensity',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> isActiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityEqualTo(
    CharacterRarity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityGreaterThan(
    CharacterRarity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityLessThan(
    CharacterRarity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityBetween(
    CharacterRarity lower,
    CharacterRarity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rarity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rarity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rarity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> rarityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rarity',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneEqualTo(
    CharacterTone value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneGreaterThan(
    CharacterTone value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneLessThan(
    CharacterTone value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneBetween(
    CharacterTone lower,
    CharacterTone upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tone',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> toneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tone',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'traitTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'traitTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'traitTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'traitTags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'traitTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'traitTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'traitTags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'traitTags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'traitTags',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'traitTags',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitTags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> traitTagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitTags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitTags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitTags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitTags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      traitTagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'traitTags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> unlockedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      unlockedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> unlockedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> unlockedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityEqualTo(
    CharacterVerbosity value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verbosity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      verbosityGreaterThan(
    CharacterVerbosity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verbosity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityLessThan(
    CharacterVerbosity value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verbosity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityBetween(
    CharacterVerbosity lower,
    CharacterVerbosity upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verbosity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'verbosity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'verbosity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verbosity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verbosity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> verbosityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verbosity',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      verbosityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verbosity',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceEqualTo(
    CharacterVoice value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceGreaterThan(
    CharacterVoice value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceLessThan(
    CharacterVoice value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceBetween(
    CharacterVoice lower,
    CharacterVoice upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'voice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'voice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voice',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voice',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voice',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> voiceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voice',
        value: '',
      ));
    });
  }
}

extension CharacterQueryObject
    on QueryBuilder<Character, Character, QFilterCondition> {}

extension CharacterQueryLinks
    on QueryBuilder<Character, Character, QFilterCondition> {}

extension CharacterQuerySortBy on QueryBuilder<Character, Character, QSortBy> {
  QueryBuilder<Character, Character, QAfterSortBy> sortByArchetype() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archetype', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByArchetypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archetype', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByEpithet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epithet', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByEpithetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epithet', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByGenerationSeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationSeed', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByGenerationSeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationSeed', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByTone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tone', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByToneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tone', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByVerbosity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbosity', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByVerbosityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbosity', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByVoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voice', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByVoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voice', Sort.desc);
    });
  }
}

extension CharacterQuerySortThenBy
    on QueryBuilder<Character, Character, QSortThenBy> {
  QueryBuilder<Character, Character, QAfterSortBy> thenByArchetype() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archetype', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByArchetypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'archetype', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByEpithet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epithet', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByEpithetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epithet', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByGenerationSeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationSeed', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByGenerationSeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generationSeed', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByRarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByRarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rarity', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByTone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tone', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByToneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tone', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByVerbosity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbosity', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByVerbosityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbosity', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByVoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voice', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByVoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voice', Sort.desc);
    });
  }
}

extension CharacterQueryWhereDistinct
    on QueryBuilder<Character, Character, QDistinct> {
  QueryBuilder<Character, Character, QDistinct> distinctByArchetype(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'archetype', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByDomainWeights() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'domainWeights');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByDomains() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'domains');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByEpithet(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'epithet', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByGenerationSeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generationSeed');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByIntensity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByRarity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rarity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByTone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByTraitTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'traitTags');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAt');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByVerbosity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verbosity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByVoice(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voice', caseSensitive: caseSensitive);
    });
  }
}

extension CharacterQueryProperty
    on QueryBuilder<Character, Character, QQueryProperty> {
  QueryBuilder<Character, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Character, CharacterArchetype, QQueryOperations>
      archetypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'archetype');
    });
  }

  QueryBuilder<Character, List<double>, QQueryOperations>
      domainWeightsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'domainWeights');
    });
  }

  QueryBuilder<Character, List<String>, QQueryOperations> domainsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'domains');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> epithetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'epithet');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> generationSeedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generationSeed');
    });
  }

  QueryBuilder<Character, CharacterIntensity, QQueryOperations>
      intensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensity');
    });
  }

  QueryBuilder<Character, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Character, CharacterRarity, QQueryOperations> rarityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rarity');
    });
  }

  QueryBuilder<Character, CharacterTone, QQueryOperations> toneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tone');
    });
  }

  QueryBuilder<Character, List<String>, QQueryOperations> traitTagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'traitTags');
    });
  }

  QueryBuilder<Character, DateTime, QQueryOperations> unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAt');
    });
  }

  QueryBuilder<Character, CharacterVerbosity, QQueryOperations>
      verbosityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verbosity');
    });
  }

  QueryBuilder<Character, CharacterVoice, QQueryOperations> voiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voice');
    });
  }
}
