import 'package:flutter/material.dart';
import 'package:rivebloc_test/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HomeView(),
      ),
    );
  }
}