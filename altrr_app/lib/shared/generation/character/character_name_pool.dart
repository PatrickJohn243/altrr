/// Name and epithet fragment pools for dynamic character generation.
///
/// All entries are static and ordered — add to any list to expand variety.
/// The generator picks from these using its seeded RNG, so additions
/// change which characters get generated for previously-unused seeds only.
class CharacterNamePool {
  CharacterNamePool._();

  // ── First names ───────────────────────────────────────────────────────────
  // 40 atmospheric names — gender-neutral, 2–3 syllables.
  // Seeds 1001–1004 are reserved for the canonical roster characters:
  // 1001 → Senna, 1002 → Kael, 1003 → Oryn, 1004 → Mira (index 0–3).
  static const List<String> names = [
    'Senna', 'Kael',  'Oryn',  'Mira',  // canonical — keep at indices 0–3
    'Veth',  'Dren',  'Lyra',  'Tarn',
    'Calix', 'Rael',  'Elan',  'Nyx',
    'Fenn',  'Aven',  'Sable', 'Zira',
    'Lorn',  'Elin',  'Voss',  'Cael',
    'Thea',  'Wren',  'Iden',  'Orla',
    'Sael',  'Davi',  'Nixe',  'Bran',
    'Rowan', 'Zael',  'Aela',  'Cire',
    'Mael',  'Ysen',  'Dala',  'Kira',
    'Aren',  'Veis',  'Tova',  'Enid',
  ];

  // ── Epithet adjectives, keyed by CharacterTone.name ──────────────────────
  // Used in: "The [adjective] [noun]"
  static const Map<String, List<String>> adjectivesByTone = {
    'stoic':   ['Iron',    'Stone',    'Still',    'Hollow',   'Quiet'  ],
    'warm':    ['Gentle',  'Golden',   'Tender',   'Bright',   'Living' ],
    'cryptic': ['Hollow',  'Veiled',   'Unseen',   'Nameless', 'Drifting'],
    'blunt':   ['Iron',    'Bare',     'Hard',     'Sharp',    'Cold'   ],
    'poetic':  ['Silver',  'Burning',  'Fading',   'Rising',   'Pale'   ],
    'playful': ['Dancing', 'Quick',    'Laughing', 'Spinning', 'Loose'  ],
    'solemn':  ['Heavy',   'Dark',     'Sunken',   'Grey',     'Slow'   ],
  };

  // ── Epithet nouns, keyed by CharacterArchetype.name ──────────────────────
  static const Map<String, List<String>> nounsByArchetype = {
    'mentor':    ['Guide',   'Hand',    'Voice',    'Path',     'Light'  ],
    'trickster': ['Mirror',  'Fool',    'Riddle',   'Shadow',   'Turn'   ],
    'sage':      ['Eye',     'Flame',   'Stone',    'Word',     'Breath' ],
    'warrior':   ['Sword',   'Arm',     'Will',     'Fist',     'Edge'   ],
    'explorer':  ['Step',    'Road',    'Wind',     'Horizon',  'Thread' ],
    'scholar':   ['Page',    'Lamp',    'Mark',     'Lens',     'Record' ],
    'caretaker': ['Heart',   'Root',    'Shore',    'Well',     'Keep'   ],
    'rogue':     ['Edge',    'Shade',   'Slip',     'Drift',    'Hook'   ],
  };
}
