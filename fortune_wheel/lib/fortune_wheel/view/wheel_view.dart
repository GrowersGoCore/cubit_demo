import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_cubit.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_state.dart';

class FortuneWheelView extends StatelessWidget {
  const FortuneWheelView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FortuneWheelCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortune Wheel'),
      ),
      body: BlocBuilder<FortuneWheelCubit, FortuneWheelState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 350,
                  child: FortuneWheel(
                    animateFirst: false,
                    duration: const Duration(seconds: 3),
                    selected: cubit.selected.stream,
                    items: [
                      for (final prize in state.prizes) ...<FortuneItem>{
                        FortuneItem(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                prize.icon,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(prize.name),
                              Text(prize.getCategory()),
                            ],
                          ),
                        )
                      }
                    ],
                    onAnimationStart: () {},
                    onAnimationEnd: () {
                      final reward = state.prizes[cubit.selected.value];
                      print(reward);
                      state.prizes.remove(reward);
                      cubit.stopTheWheel();
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    state.canSpin && !state.isWheelSpinning
                        ? cubit.spinTheWheel()
                        : null;
                  },
                  child: state.canSpin
                      ? Text('Spin the wheel (${state.spins})')
                      : const Text('No spins remaining'),
                ),
                ElevatedButton(
                  onPressed: () {
                    state.canSpin && !state.isWheelSpinning
                        ? cubit.spinTheWheelTricked()
                        : null;
                  },
                  child: state.canSpin
                      ? Text('Hehehe (${state.spins})')
                      : const Text('No spins remaining'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
