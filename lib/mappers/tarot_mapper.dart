import 'package:flu_avm/config/entities/tarot_card.dart';
import 'package:flu_avm/config/models/tarotapi_responsio.dart';

class TarotMapper {
  static TarotCard toEntity(TarotApiCard card, int index) {
    return TarotCard(
      name: card.name,
      meaning: card.text,
      image:
          'https://raw.githubusercontent.com/jorgenbuilder/tarotdeck/main/art/${index + 1}.webp',
      reversed: false,
    );
  }
}
