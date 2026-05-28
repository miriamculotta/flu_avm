import 'package:flutter/material.dart';
import 'dart:math';

class TarotScreen extends StatefulWidget {
  const TarotScreen({super.key});

  @override
  State<TarotScreen> createState() => _TarotScreenState();
}

class _TarotScreenState extends State<TarotScreen> {
  final List<Map<String, String>> cartas = [
    {
      'titulo': 'La Estrella',
      'descripcion': 'Esperanza, claridad, guía interior.',
      'imagen': 'assets/images/tarot/estrella.png',
    },
    {
      'titulo': 'La Luna',
      'descripcion': 'Intuición, misterio, emociones profundas.',
      'imagen': 'assets/images/tarot/luna.png',
    },
    {
      'titulo': 'El Sol',
      'descripcion': 'Éxito, energía, claridad total.',
      'imagen': 'assets/images/tarot/sol.png',
    },
  ];

  Map<String, String>? cartaActual;

  void sacarCarta() {
    final random = Random();
    setState(() {
      cartaActual = cartas[random.nextInt(cartas.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tarot')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: scheme.shadow.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              width: 220,
              height: 350,
              child: cartaActual == null
                  ? Center(
                      child: Text(
                        'Saca una carta',
                        style: TextStyle(
                          color: scheme.onPrimaryContainer,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            cartaActual!['imagen']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          cartaActual!['titulo']!,
                          style: TextStyle(
                            color: scheme.onPrimaryContainer,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cartaActual!['descripcion']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: scheme.onPrimaryContainer,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: sacarCarta,
              child: const Text('Sacar carta'),
            ),
          ],
        ),
      ),
    );
  }
}
