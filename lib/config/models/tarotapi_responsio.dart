class TarotApiCard {
  final String nameShort;
  final String name;
  final String text;
  final String value;

  TarotApiCard({
    required this.nameShort,
    required this.name,
    required this.text,
    required this.value,
  });

  factory TarotApiCard.fromJson(Map<String, dynamic> json) {
    return TarotApiCard(
      nameShort: json['name_short'] ?? '',
      name: json['name'] ?? '',
      text: json['text'] ?? '',
      value: json['value'] ?? '',
    );
  }
}
