import 'package:flu_avm/config/entities/tarot_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import '../../providers/tarot_provider.dart';

class TarotScreen extends ConsumerStatefulWidget {
  const TarotScreen({super.key});

  @override
  ConsumerState<TarotScreen> createState() => _TarotScreenState();
}

class _TarotScreenState extends ConsumerState<TarotScreen>
    with SingleTickerProviderStateMixin {
  TarotCard? selectedCard;
  final Random _random = Random();
  late AnimationController? _floatController;
  late Animation<double>? _floatAnimation;

  static const String _previewUrl =
      'https://raw.githubusercontent.com/jorgenbuilder/tarotdeck/main/art/preview.png';

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController!, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController?.dispose();
    super.dispose();
  }

  void _drawRandomCard(List<TarotCard> cards) {
    setState(() {
      selectedCard = cards[_random.nextInt(cards.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    final tarotAsync = ref.watch(tarotCardProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0014),
      appBar: AppBar(
        title: const Text('Tarot Deck'),
        backgroundColor: const Color(0xFF1A0633),
        foregroundColor: Colors.white,
      ),
      body: tarotAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (cards) {
          return Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [Color(0xFF2A0A4A), Color(0xFF0B0014)],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CONSULTA EL TAROT',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => _drawRandomCard(cards),
                      child: AnimatedBuilder(
                        animation: _floatAnimation!,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _floatAnimation!.value),
                            child: child,
                          );
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 600),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleTransition(
                                  scale: animation, child: child),
                            );
                          },
                          child: _buildCardFace(
                            key: ValueKey(selectedCard?.name ?? 'preview'),
                            imageUrl: selectedCard?.image ?? _previewUrl,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: selectedCard == null
                          ? Column(
                              key: const ValueKey('hint'),
                              children: const [
                                Icon(Icons.touch_app,
                                    color: Colors.white24, size: 28),
                                SizedBox(height: 8),
                                Text(
                                  'Toca la carta para revelar',
                                  style: TextStyle(
                                    color: Colors.white24,
                                    fontSize: 13,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            )
                          : Padding(
                              key: ValueKey(selectedCard!.name),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 36),
                              child: Column(
                                children: [
                                  Text(
                                    selectedCard!.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  const Text(
                                    '✦  SIGNIFICADO  ✦',
                                    style: TextStyle(
                                      color: Colors.white24,
                                      fontSize: 10,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    selectedCard!.meaningUp,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      height: 1.7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardFace({required Key key, required String imageUrl}) {
    return Container(
      key: key,
      width: 200,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.25),
            blurRadius: 40,
            spreadRadius: 6,
          ),
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 60,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              color: const Color(0xFF1A0633),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            );
          },
          errorBuilder: (context, error, _) => Container(
            color: const Color(0xFF1A0633),
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.white24, size: 48),
            ),
          ),
        ),
      ),
    );
  }
}
