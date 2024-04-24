import 'package:carousel_test/carousel/cubit/carousel_cubit.dart';
import 'package:carousel_test/carousel/view/carousel_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselCubit(),
      child: const CarouselView(),
    );
  }
}
