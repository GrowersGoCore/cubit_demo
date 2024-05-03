import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_cubit.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_state.dart';

class FortuneWheelView extends StatefulWidget {
  const FortuneWheelView({super.key});

  @override
  State<FortuneWheelView> createState() => _FortuneWheelViewState();
}

class _FortuneWheelViewState extends State<FortuneWheelView>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late AnimationController _scaleController;
  late AnimationController _rotateController;
  late Animation<double> _positionAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _positionController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _rotateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _positionAnimation =
        Tween<double>(begin: 0, end: 300).animate(_positionController);
    _scaleAnimation = Tween<double>(begin: 1, end: 2).animate(_scaleController);
    _rotateAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_rotateController);

    _animateWheelPositionScaleAndRotation();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  void _animateWheelPositionScaleAndRotation() {
    if (_positionController.isAnimating ||
        _scaleController.isAnimating ||
        _rotateController.isAnimating) {
      _positionController.stop();
      _scaleController.stop();
      _rotateController.stop();
    }
    _positionController.reset();
    _scaleController.reset();
    _rotateController.reset();
    _positionController.forward();
    _scaleController.forward();
    _rotateController.forward();
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        state.canSpin && !state.isWheelSpinning
                            ? cubit.spinTheWheel()
                            : null;
                      },
                      child: state.canSpin
                          ? Text('Lucky spin (${state.spins})')
                          : const Text('No spins remaining'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        state.canSpin && !state.isWheelSpinning
                            ? cubit.spinTheWheelTricked()
                            : null;
                      },
                      child: state.canSpin
                          ? Text('Tricked spin (${state.spins})')
                          : const Text('No spins remaining'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    cubit.addMoreSpins();
                  },
                  child: const Text('Add more spins'),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 350,
                  child: AnimatedBuilder(
                    animation: _positionAnimation,
                    builder: (context, child) {
                      return AnimatedBuilder(
                        animation: _scaleAnimation,
                        builder: (context, child) {
                          return AnimatedBuilder(
                            animation: _rotateAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, _positionAnimation.value),
                                child: Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: Transform.rotate(
                                    angle: _rotateAnimation.value,
                                    child: FortuneWheel(
                                      animateFirst: false,
                                      duration: const Duration(seconds: 3),
                                      selected: cubit.selected.stream,
                                      indicators: const <FortuneIndicator>[
                                        FortuneIndicator(
                                          alignment: Alignment.topCenter,
                                          child: TriangleIndicator(
                                            color: Colors.white70,
                                            width: 15,
                                            height: 15,
                                            elevation: 8,
                                          ),
                                        ),
                                      ],
                                      items: [
                                        for (final prize
                                            in state.prizes) ...<FortuneItem>{
                                          FortuneItem(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 25,
                                                ),
                                                Transform.rotate(
                                                  angle: -9.430,
                                                  child: Text(prize.name),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Transform.rotate(
                                                  angle: -4.715,
                                                  child: Image.asset(
                                                    prize.icon,
                                                    height: 35,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            style: FortuneItemStyle(
                                              color: prize.getCategoryColor(),
                                              borderColor:
                                                  prize.getCategoryColor(),
                                              borderWidth: 1,
                                            ),
                                          )
                                        }
                                      ],
                                      onFling: () {
                                        cubit.spinTheWheel();
                                      },
                                      onAnimationEnd: () {
                                        final reward =
                                            state.prizes[cubit.selected.value];
                                        print(
                                            '${reward.name} ${reward.getCategory()}');
                                        cubit.stopTheWheel();
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
