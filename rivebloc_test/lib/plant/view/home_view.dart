import 'package:flutter/material.dart';
import 'package:rivebloc_test/plant/view/plant_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlantPage(),
                  ),
                );
              },
              child: const Text("Plant"),
            ),
          ],
        )
      )
    );
  }
}