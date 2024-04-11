import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multianimation/cubit/multianimation_cubit.dart';

class MultianimationView extends StatefulWidget {
  const MultianimationView({Key? key}) : super(key: key);

  @override
  _MultianimationViewState createState() => _MultianimationViewState();
}

class _MultianimationViewState extends State<MultianimationView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MultianimationCubit>(context).loadArtboardNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Animations'),
      ),
      body: BlocBuilder<MultianimationCubit, double>(
        builder: (context, sliderValue) {
          final cubit = BlocProvider.of<MultianimationCubit>(context);
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: cubit.backgroundArtboards.isNotEmpty
                      ? RiveAnimation.asset(
                          'assets/multy2.riv',
                          artboard: cubit
                              .backgroundArtboards[sliderValue.toInt()],
                          fit: BoxFit.contain,
                        )
                      : const CircularProgressIndicator(),
                ),
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: cubit.getSliderMax(),
                  divisions: cubit.getSliderDivisions(),
                  onChanged: (value) {
                    cubit.updateSliderValue(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}