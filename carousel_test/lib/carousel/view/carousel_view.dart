import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';

class CarouselView extends StatelessWidget {
  const CarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roulette"),
      ),
      body: CustomCarousel(
        effectsBuilder: (index, scrollRatio, child) {
          Transform.translate(
              offset: Offset(0, scrollRatio * 250), child: child);
        },
        children: [
          Text('Prueba 1'),
          Text('Prueba 2'),
          Text('Prueba 3'),
        ],
      ),
    );
  }
}
