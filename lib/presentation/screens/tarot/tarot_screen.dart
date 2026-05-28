import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/tarot_provider.dart';

class TarotScreen extends ConsumerStatefulWidget {
  const TarotScreen({super.key});

  @override
  ConsumerState<TarotScreen> createState() => _TarotScreenState();
}

class _TarotScreenState extends ConsumerState<TarotScreen>
    with SingleTickerProviderStateMixin {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final tarotAsync = ref.watch(tarotCardProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0014),
      appBar: AppBar(
        title: const Text('Tarot Deck'),
        backgroundColor: const Color(0xFF1A0633),
      ),
      body: tarotAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (cards) {
          final selectedCard =
              selectedIndex != null ? cards[selectedIndex!] : null;

          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                      ),
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final card = cards[index];
                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: isSelected
                                  ? Border.all(
                                      color: Colors.amber,
                                      width: 3,
                                    )
                                  : null,
                              image: DecorationImage(
                                image: NetworkImage(card
                                    .image), // ✅ usa card.image de cada carta
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (selectedCard != null)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = null;
                      });
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.85),
                      child: Center(
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutBack,
                          scale: 1,
                          child: Container(
                            width: 260,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A0633),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    selectedCard.image,
                                    height: 300,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) return child;
                                      return const SizedBox(
                                        height: 300,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.amber,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  selectedCard.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  selectedCard.meaning,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
