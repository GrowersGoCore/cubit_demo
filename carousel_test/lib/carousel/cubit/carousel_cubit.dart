import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:carousel_test/carousel/cubit/carousel_state.dart';
import 'package:carousel_test/prize/prize.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(const CarouselState());

  int generateSpins() {
    Random random = Random();
    int spins = random.nextInt(3);
    return spins;
  }

  List<Prize> createPrizes() {
    List<Prize> prizes = [];

    for (int i = 1; i <= 2; i++) {
      Prize prize = Prize(name: 'Prize $i', category: Category.category1);
      prizes.add(prize);
    }
    for (int i = 1; i <= 2; i++) {
      Prize prize = Prize(name: 'Prize $i', category: Category.category2);
      prizes.add(prize);
    }
    for (int i = 1; i <= 2; i++) {
      Prize prize = Prize(name: 'Prize $i', category: Category.category3);
      prizes.add(prize);
    }

    return prizes;
  }

  void loadPrizes() {
    List<Prize> prizes = createPrizes();
    emit(state.copyWith(prizes: prizes));
  }
}
