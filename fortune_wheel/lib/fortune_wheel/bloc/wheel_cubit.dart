import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fortune_wheel/fortune_wheel/bloc/wheel_state.dart';
import 'package:fortune_wheel/prize/prize.dart';
import 'package:rxdart/subjects.dart';

class FortuneWheelCubit extends Cubit<FortuneWheelState> {
  FortuneWheelCubit() : super(const FortuneWheelState());

  final selected = BehaviorSubject<int>();
  bool isWheelSpinning = false;

  void init() {
    generateSpins();
    generatePrizes();
  }

  void generateSpins() {
    int spins = Random().nextInt(5) + 1;
    emit(state.copyWith(spins: spins));
  }

  void generatePrizes() {
    emit(state.copyWith(
      prizes: [
        Prize(
            icon: 'assets/icon1.png',
            name: 'Prize 1',
            category: Category.category1,
            categoryColor: CategoryColor.category1),
        Prize(
            icon: 'assets/icon1.png',
            name: 'Prize 2',
            category: Category.category1,
            categoryColor: CategoryColor.category1),
        Prize(
            icon: 'assets/icon1.png',
            name: 'Prize 1',
            category: Category.category2,
            categoryColor: CategoryColor.category2),
        Prize(
            icon: 'assets/icon1.png',
            name: 'Prize 2',
            category: Category.category2,
            categoryColor: CategoryColor.category2),
        Prize(
            icon: 'assets/icon1.png',
            name: 'Prize 1',
            category: Category.category3,
            categoryColor: CategoryColor.category3),
        Prize(
            icon: 'assets/icon1.png',
            name: 'Prize 2',
            category: Category.category3,
            categoryColor: CategoryColor.category3),
      ]..shuffle(),
    ));
  }

  void spinTheWheel() {
    if (state.spins > 0) {
      selected.add(Random().nextInt(state.prizes.length));
      updateSpins();
      isWheelSpinning = true;
    }
    emit(state.copyWith(
        selected: selected,
        spins: state.spins,
        isWheelSpinning: isWheelSpinning));
  }

  void spinTheWheelTricked() {
    if (state.spins > 0) {
      const itemIndex = 2; // Index of the item that you always want to win

      selected.add(itemIndex);
      updateSpins();
    }
    emit(state.copyWith(
        selected: selected,
        spins: state.spins,
        isWheelSpinning: isWheelSpinning));
  }

  void stopTheWheel() {
    isWheelSpinning = false;
    emit(state.copyWith(isWheelSpinning: isWheelSpinning));
  }

  void updateSpins() {
    final newSpins = state.spins - 1;
    emit(state.copyWith(spins: newSpins, canSpin: newSpins > 0));
  }
}
