import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_state.dart';
import 'package:fortune_wheel/fortune_wheel/view/wheel_view.dart';
import 'package:fortune_wheel/prize/prize.dart';

class FortuneWheelCubit extends Cubit<FortuneWheelState> {
  FortuneWheelCubit() : super(const FortuneWheelState());

  StreamController<int> controller = StreamController<int>();
  int spins = 0;
  bool canSpin = true;
  List<Prize> prizes = [];

  int generateSpins() {
    int spins = Random().nextInt(5) + 1;
    return spins;
  }

  void updateSpins() {
    spins--;
    if (spins <= 0) {
      canSpin = false;
    }
    emit(state.copyWith(spins: spins, canSpin: canSpin));
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
    emit(state.copyWith(controller: controller, spins: spins));
  }
}
