import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';

class PlantCubit extends Cubit<double> {
  PlantCubit() : super(0);

  late SMIInput _grow;
  double sliderValue = 0;

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _grow = controller.findInput<double>('grow')!;
  }

  double updateGrowValue(double value) {
      sliderValue = value;
      _grow.value = value;
    return value;
  }

  double getSliderValue() {
    return sliderValue;
  }
}