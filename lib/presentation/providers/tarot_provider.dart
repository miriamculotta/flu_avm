import 'package:flu_avm/config/entities/tarot_card.dart';
import 'package:flu_avm/mappers/tarot_mapper.dart';
import 'package:flu_avm/services/tarot_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tarotCardProvider = FutureProvider<List<TarotCard>>((ref) async {
  final service = TarotService();

  final apiCards = await service.getAllCards();

  return apiCards.asMap().entries.map((entry) {
    final index = entry.key;
    final card = entry.value;

    return TarotMapper.toEntity(card, index);
  }).toList();
});
