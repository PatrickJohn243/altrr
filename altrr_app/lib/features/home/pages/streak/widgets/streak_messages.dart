const _msgDay1 = [
  'The first day is the hardest.\nYou showed up.',
  'One day in.\nEvery streak starts right here.',
  'Day one done.\nLet\'s see where this goes.',
];

const _msgEarly = [
  'Keep showing up.\nIt\'s working.',
  'The habit is forming.\nDon\'t let it slip.',
  'A few days in.\nYou\'re building something.',
];

const _msgDay10 = [
  'Ten days.\nYou\'re not stopping.',
  'Double digits.\nKeep going.',
  'Ten in a row.\nThis is getting real.',
];

const _msgDay20 = [
  'Twenty days.\nThat\'s real discipline.',
  'Three weeks of showing up.\nNice.',
  'Day twenty.\nYou\'re consistent now.',
];

const _msgDay50 = [
  'Fifty days.\nMost people quit at one.',
  'You\'ve made this part of who you are.',
  'Fifty days in.\nThis is just your life now.',
];

String streakMessage(int streak) {
  final List<String> pool;
  if (streak <= 1) {
    pool = _msgDay1;
  } else if (streak < 10) {
    pool = _msgEarly;
  } else if (streak < 20) {
    pool = _msgDay10;
  } else if (streak < 50) {
    pool = _msgDay20;
  } else {
    pool = _msgDay50;
  }
  return pool[streak % pool.length];
}
