import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/tarot_provider.dart';

class TarotScreen extends ConsumerWidget {
  const TarotScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarotAsync = ref.watch(tarotCardProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tarot')),

      body: tarotAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text('Error: $e')),

        data: (cards) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cards.length,

            itemBuilder: (context, index) {
              final card = cards[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Transform.rotate(
                        angle: card.reversed ? math.pi : 0,
                        child: Image.network(
                          card.image,
                          height: 220,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image,
                              size: 80,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        card.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(card.meaning, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(tarotCardProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
