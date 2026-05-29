import 'dart:math';

import 'package:flu_avm/config/entities/tarot_card.dart';
import 'package:flu_avm/config/models/tarotapi_responsio.dart';

class TarotMapper {
  static const String _baseImage =
      'https://raw.githubusercontent.com/jorgenbuilder/tarotdeck/main/art';

  static TarotCard toEntity(
    TarotApiCard card,
    int deckIndex,
  ) {
    final isReversed = Random().nextBool();

    return TarotCard(
      name: card.name,
      meaning: card.text,
      meaningUp: card.meaningUp,
      meaningRev: card.meaningRev,
      image: '$_baseImage/$deckIndex.webp',
      reversed: isReversed,
    );
  }
}
