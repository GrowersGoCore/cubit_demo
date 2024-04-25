import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fortune_wheel/prize/prize.dart';

class FortuneWheelState extends Equatable {
  const FortuneWheelState({
    //required this.controller,
    this.spins = 0,
    this.canSpin = true,
    this.prizes = const <Prize>[],
  });

  //final StreamController controller;
  final int spins;
  final bool canSpin;
  final List<Prize> prizes;

  @override
  List<Object?> get props => [
        //controller,
        spins,
        canSpin,
        prizes,
      ];

  FortuneWheelState copyWith({
    StreamController? controller,
    int? spins,
    bool? canSpin,
    List<Prize>? prizes,
  }) {
    return FortuneWheelState(
      //controller: this.controller,
      spins: spins ?? this.spins,
      canSpin: canSpin ?? this.canSpin,
      prizes: prizes ?? this.prizes,
    );
  }
}
