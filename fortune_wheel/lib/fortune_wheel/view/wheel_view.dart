import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_cubit.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_state.dart';
import 'package:fortune_wheel/prize/prize.dart';

/*class FortuneWheelView extends StatefulWidget {
  const FortuneWheelView({super.key});

  @override
  FortuneWheelViewState createState() => FortuneWheelViewState();
}*/

/*StreamController<int> controller = StreamController<int>();
int spins = generateSpins();
String spinsIndicator = '$spins remaining';
bool canSpin = true;
List<Prize> prizes = generatePrizes();*/

class FortuneWheelView extends StatelessWidget {
  const FortuneWheelView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FortuneWheelCubit>();

    StreamController<int> controller = cubit.controller;
    int spins = cubit.generateSpins();
    bool canSpin = cubit.canSpin;
    List<Prize> prizes = cubit.generatePrizes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortune Wheel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: FortuneWheel(
                animateFirst: false,
                duration: const Duration(seconds: 3),
                selected: controller.stream,
                items: [
                  for (int i = 0; i < prizes.length; i++) ...<FortuneItem>{
                    FortuneItem(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(prizes[i].name),
                          Text(prizes[i].getCategory()),
                        ],
                      ),
                    )
                  }
                ],
                onAnimationEnd: () {
                  final reward = controller.stream;
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                canSpin ? cubit.spinTheWheel() : null;
              },
              child: Text('$spins remaining'),
            ),
          ],
        ),
      ),
    );
  }
}

// FUNCTIONS
/*int generateSpins() {
  int spins = Random().nextInt(5) + 1;
  return spins;
}

void updateSpins() {
  spins--;
  spinsIndicator = '$spins remaining';
  if (spins <= 0) {
    canSpin = false;
  }
}

List<Prize> generatePrizes() {
  List<Prize> prizes = [
    Prize(
        icon: Image.asset('assets/icon1.png').toString(),
        name: 'Prize 1',
        category: Category.category1),
    Prize(
        icon: Image.asset('assets/icon1.png').toString(),
        name: 'Prize 2',
        category: Category.category2),
    Prize(
        icon: Image.asset('assets/icon1.png').toString(),
        name: 'Prize 3',
        category: Category.category3),
  ];
  return prizes;
}

void spinTheWheel() {
  if (spins > 0) {
    controller.add(Random().nextInt(prizes.length));
    updateSpins();
  }
}*/
