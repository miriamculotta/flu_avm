class TarotApiCard {
  final String nameShort;
  final String name;
  final String text;
  final String value;
  final int valueInt;
  final String meaningUp;
  final String meaningRev;

  TarotApiCard({
    required this.nameShort,
    required this.name,
    required this.text,
    required this.value,
    required this.valueInt,
    required this.meaningUp,
    required this.meaningRev,
  });

  factory TarotApiCard.fromJson(Map<String, dynamic> json) {
    return TarotApiCard(
      nameShort: json['name_short'] ?? '',
      name: json['name'] ?? '',
      text: json['desc'] ?? '',
      value: json['value'] ?? '',
      valueInt: json['value_int'] ?? 0,
      meaningUp: json['meaning_up'] ?? '',
      meaningRev: json['meaning_rev'] ?? '',
    );
  }
}
