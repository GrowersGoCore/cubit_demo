import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_cubit.dart';
import 'package:fortune_wheel/fortune_wheel/view/wheel_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FortuneWheelCubit(),
      child: MaterialApp(
        title: 'Fortune Wheel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FortuneWheelView(),
      ),
    );
  }
}
