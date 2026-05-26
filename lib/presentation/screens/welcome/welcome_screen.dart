import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [_HeaderSection(), SizedBox(height: 20)],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends ConsumerWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.data_object_rounded, size: 32),
            SizedBox(width: 8),
            Text(
              'Flu Avm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            ref.read(estTenebrisModusProvider.notifier).state =
                !estTenebrisModus;
          },
          icon: Icon(
            estTenebrisModus
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
        ),
      ],
    );
  }
}
