import 'dart:math';
import 'package:flu_avm/config/entities/tarot_card.dart';
import 'package:flu_avm/config/models/tarotapi_responsio.dart';

class TarotMapper {
  static TarotCard toEntity(TarotApiCard card) {
    final reversed = Random().nextBool();

    return TarotCard(
      name: card.name,
      meaning: card.text,
      reversed: reversed,

      image:
          'https://raw.githubusercontent.com/jorgenbuilder/tarotdeck/main/art/${card.nameShort}.png',
    );
  }
}
