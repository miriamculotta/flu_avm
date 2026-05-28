import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/entities/tarot_card.dart';
import '../../services/tarot_service.dart';
import '../../mappers/tarot_mapper.dart';

final tarotCardProvider =
    FutureProvider<List<TarotCard>>((ref) async {

  final service = TarotService();

  final apiCards =
      await service.getRandomCards(3);

  return apiCards
      .map(TarotMapper.toEntity)
      .toList();
});