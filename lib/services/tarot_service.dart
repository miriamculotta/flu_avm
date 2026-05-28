import 'dart:convert';
import 'package:flu_avm/config/models/tarotapi_responsio.dart';
import 'package:http/http.dart' as http;

class TarotService {
  static const String baseUrl = 'https://tarotapi.dev/api/v1';

  Future<List<TarotApiCard>> getRandomCards(int n) async {
    final response = await http.get(Uri.parse('$baseUrl/cards/random?n=$n'));
    if (response.statusCode != 200) throw Exception('Error API Tarot');
    final decoded = jsonDecode(response.body);
    final List list = decoded is List ? decoded : decoded['cards'];
    return list
        .map((e) => TarotApiCard.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<TarotApiCard>> getAllCards() async {
    final response = await http.get(Uri.parse('$baseUrl/cards'));
    if (response.statusCode != 200) throw Exception('Error API Tarot');
    final decoded = jsonDecode(response.body);
    final List list = decoded is List ? decoded : decoded['cards'];
    return list
        .map((e) => TarotApiCard.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
