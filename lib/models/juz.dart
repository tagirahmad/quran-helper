class Juz {
  const Juz({
    required this.juzNumber,
    required this.verseMapping,
    required this.versesCount,
  });

  final int juzNumber;
  final Map<String, String> verseMapping;
  final int versesCount;

  factory Juz.fromJson(Map<String, dynamic> json) {
    final juzNumber = json['juz_number'] as int;
    final verseMapping = Map<String, String>.from(json['verse_mapping']);
    final versesCount = json['verses_count'] as int;

    return Juz(juzNumber: juzNumber, verseMapping: verseMapping, versesCount: versesCount);
  }
}

