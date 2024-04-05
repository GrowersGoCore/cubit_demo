import 'package:flutter/material.dart';
import 'package:rivebloc_test/plant/view/home_page.dart';

void main() {
  runApp(const RiveblocTest());
}

class RiveblocTest extends StatelessWidget {
  const RiveblocTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tu Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage());
  }
}
