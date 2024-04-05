import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivebloc_test/plant/cubit/plant_cubit.dart';
import 'package:rivebloc_test/plant/view/plant_view.dart';

class PlantPage extends StatelessWidget {
  const PlantPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlantCubit(),
      child: const PlantView(),
    );
  }
}