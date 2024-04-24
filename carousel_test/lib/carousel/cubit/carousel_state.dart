import 'package:carousel_test/prize/prize.dart';
import 'package:equatable/equatable.dart';

class CarouselState extends Equatable {
  const CarouselState({
    List<Prize>? prizes,
  }) : prizes = prizes ?? const [];

  final List<Prize> prizes;

  @override
  List<Object?> get props => [
        prizes,
      ];

  CarouselState copyWith({
    List<Prize>? prizes,
  }) {
    return CarouselState(prizes: prizes ?? this.prizes);
  }
}
