import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multianimation/cubit/multianimation_cubit.dart';
import 'package:rivebloc_test/multianimation/cubit/multianimation_state.dart';

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
      body: BlocBuilder<MultianimationCubit, MultianimationState>(
        builder: (context, multianimationState) {
          final cubit = BlocProvider.of<MultianimationCubit>(context);
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: multianimationState.backgroundArtboards.isNotEmpty
                      ? RiveAnimation.asset(
                          'assets/multy2.riv',
                          artboard: multianimationState.backgroundArtboards[multianimationState.sliderMax.toInt()],
                          fit: BoxFit.contain,
                        )
                      : const CircularProgressIndicator(),
                ),
                Slider(
                  value: multianimationState.sliderMax,
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