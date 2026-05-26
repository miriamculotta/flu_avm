import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeaderSection(),
              SizedBox(height: 30),
              _MainImagesSection(),
              SizedBox(height: 30),
              _StatusSection(),
              SizedBox(height: 20),
              _TitleDescriptionSection(),
              SizedBox(height: 30),
              _CardsSection(),
              SizedBox(height: 40),
              _FooterSection(),
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

class _MainImagesSection extends StatelessWidget {
  const _MainImagesSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Cuadrado violeta del móvil
        Expanded(
          child: Center(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100, // violeta suave
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/movil.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        // Puntos (sin cuadrado)
        Expanded(
          child: Center(
            child: Image.asset(
              'assets/images/puntos.png',
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Cuadrado violeta del servidor
        Expanded(
          child: Center(
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100, // violeta suave
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
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
    return Center(
      child: Text(
        '● CONECTADO',
        style: TextStyle(
          color: Colors.green.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _TitleDescriptionSection extends StatelessWidget {
  const _TitleDescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'WebSockets en vivo',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Aprende a construir apps con datos en tiempo real en Flutter.\n'
          'Dos ejemplos prácticos te esperan dentro.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class _CardsSection extends StatelessWidget {
  const _CardsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FeatureCard(
          image: 'assets/images/mapa.jpg',
          title: 'Mapas',
          subtitle: 'Ubicación en tiempo real',
        ),
        const SizedBox(height: 20),
        _FeatureCard(
          image: 'assets/images/votaciones.jpg',
          title: 'Votaciones',
          subtitle: 'Gráfico que se actualiza',
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              image,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '5 PANTALLAS   •   2 WEBSOCKETS',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        const Text('MIRIAM', style: TextStyle(fontSize: 14)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Comenzar'),
        ),
      ],
    );
  }
}
