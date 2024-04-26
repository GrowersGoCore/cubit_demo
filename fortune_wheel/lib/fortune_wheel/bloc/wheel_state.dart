import 'package:equatable/equatable.dart';
import 'package:fortune_wheel/prize/prize.dart';
import 'package:rxdart/subjects.dart';

class FortuneWheelState extends Equatable {
  const FortuneWheelState({
    this.spins = 0,
    this.canSpin = true,
    this.prizes = const <Prize>[],
    this.isWheelSpinning = false,
  });

  final int spins;
  final bool canSpin;
  final List<Prize> prizes;
  final bool isWheelSpinning;

  @override
  List<Object?> get props => [
        spins,
        canSpin,
        prizes,
        isWheelSpinning,
      ];

  FortuneWheelState copyWith({
    BehaviorSubject? selected,
    int? spins,
    bool? canSpin,
    List<Prize>? prizes,
    bool? isWheelSpinning,
  }) {
    return FortuneWheelState(
      spins: spins ?? this.spins,
      canSpin: canSpin ?? this.canSpin,
      prizes: prizes ?? this.prizes,
      isWheelSpinning: isWheelSpinning ?? this.isWheelSpinning,
    );
  }
}
