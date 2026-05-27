import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeaderSection(),
              SizedBox(height: 40),
              _MainImagesSection(),
              SizedBox(height: 40),
              _StatusSection(),
              SizedBox(height: 30),
              _TitleDescriptionSection(),
              SizedBox(height: 40),
              _CardsSection(),
              SizedBox(height: 60),
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

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Recuadro WS
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'WS',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 4), // ← ANTES ERA 20
              // Puntos
              Image.asset(
                'assets/images/puntos.png',
                height: 40,
                fit: BoxFit.contain,
              ),
            ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.shade100, // VERDE CLARO
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            '● CONECTADO',
            style: TextStyle(
              color: Color.fromARGB(255, 34, 131, 37),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'WebSockets en vivo',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Aprende a construir apps con datos en tiempo real en Flutter. '
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Expanded(
          child: _FeatureCard(
            image: 'assets/images/mapa.jpg',
            title: 'Mapas',
            subtitle: 'Ubicación en tiempo real',
          ),
        ),
        SizedBox(width: 20), // espacio entre tarjetas
        Expanded(
          child: _FeatureCard(
            image: 'assets/images/votaciones.jpg',
            title: 'Votaciones',
            subtitle: 'Gráfico que se actualiza',
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

  const _FeatureCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        // relieve suave
        boxShadow: [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],

        // ⭐ Borde violeta (como en tu boceto)
        border: Border.all(
          color: Colors.deepPurple, // ← AQUÍ EL VIOLETA
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
            textAlign: TextAlign.center,
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
        // FILA DE RECUADROS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Recuadro 1: 5 pantallas
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '5 PANTALLAS',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            // Recuadro 2: 2 websockets
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '2 WEBSOCKETS',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),

            // Recuadro 3: Nombre
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'MIRIAM',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

        const SizedBox(height: 80),

        ElevatedButton(
          onPressed: () {
            context.push('/home');
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Comenzar'),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
