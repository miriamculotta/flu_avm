import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: c.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderSection(),
              const SizedBox(height: 40),
              const _MainImagesSection(),
              const SizedBox(height: 40),
              const _StatusSection(),
              const SizedBox(height: 30),
              const _TitleDescriptionSection(),
              const SizedBox(height: 40),
              const _CardsSection(),
              const SizedBox(height: 60),
              const _FooterSection(),
            ],
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
    final c = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: c.primaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.data_object_rounded,
                size: 28,
                color: c.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Flu Avm',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: c.onSurface,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: c.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            onPressed: () {
              ref.read(estTenebrisModusProvider.notifier).state =
                  !estTenebrisModus;
            },
            icon: Icon(
              estTenebrisModus
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded,
              color: c.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _MainImagesSection extends StatelessWidget {
  const _MainImagesSection();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    BoxDecoration deco = BoxDecoration(
      gradient: LinearGradient(
        colors: [c.primaryContainer, c.secondaryContainer],
      ),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: c.outline.withOpacity(0.25)),
      boxShadow: [
        BoxShadow(
          color: c.primary.withOpacity(0.15),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Container(
              width: 95,
              height: 95,
              decoration: deco,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/movil.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: c.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'WS',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: c.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Image.asset(
                'assets/images/puntos.png',
                height: 42,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: 95,
              height: 95,
              decoration: deco,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/servidor.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatusSection extends StatelessWidget {
  const _StatusSection();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: c.tertiaryContainer,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: c.outline.withOpacity(0.25)),
          ),
          child: Row(
            children: [
              Icon(Icons.circle, size: 10, color: c.primary),
              const SizedBox(width: 8),
              Text(
                'CONECTADO',
                style: TextStyle(
                  color: c.onTertiaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TitleDescriptionSection extends StatelessWidget {
  const _TitleDescriptionSection();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [c.surfaceContainerLow, c.surfaceContainer],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WebSockets en vivo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: c.onSurface,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Aprende a construir apps con datos en tiempo real en Flutter. '
            'Dos ejemplos prácticos te esperan dentro.',
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: c.onSurface.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardsSection extends StatelessWidget {
  const _CardsSection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _FeatureCard(
            image: 'assets/images/mapa.jpg',
            title: 'Mapas',
            subtitle: 'Ubicación en tiempo real',
            route: '/charta',
          ),
        ),
        SizedBox(width: 18),
        Expanded(
          child: _FeatureCard(
            image: 'assets/images/votaciones.jpg',
            title: 'Votaciones',
            subtitle: 'Gráfico que se actualiza',
            route: '/bands',
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String route;

  const _FeatureCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: c.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: c.outline.withOpacity(0.15)),
          boxShadow: [
            BoxShadow(
              color: c.primary.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                image,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: c.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: c.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _FooterBadge(number: '5', text: 'PANTALLAS', colorum: c),
            _FooterBadge(number: '2', text: 'WEBSOCKETS', colorum: c),
            _FooterBadge(
              number: 'MC',
              text: 'MIRIAM',
              colorum: c,
              highlight: true,
            ),
          ],
        ),

        const SizedBox(height: 50),

        ElevatedButton(
          onPressed: () => context.push('/home'),
          style: ElevatedButton.styleFrom(
            backgroundColor: c.primary,
            foregroundColor: c.onPrimary,
            overlayColor: c.primaryContainer,
            textStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 0,
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Comenzar'),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward_rounded, size: 22),
            ],
          ),
        ),
      ],
    );
  }
}

class _FooterBadge extends StatelessWidget {
  final String number;
  final String text;
  final ColorScheme colorum;
  final bool highlight;

  const _FooterBadge({
    required this.number,
    required this.text,
    required this.colorum,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          color: highlight
              ? colorum.primaryContainer
              : colorum.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: colorum.outline.withOpacity(0.15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: highlight ? colorum.onPrimaryContainer : colorum.primary,
              ),
            ),

            const SizedBox(height: 6),

            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: highlight
                      ? colorum.onPrimaryContainer
                      : colorum.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
