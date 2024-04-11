import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';

class MultianimationCubit extends Cubit<double> {
  MultianimationCubit() : super(0); // Pass the new service as parameter

  List<String> backgroundArtboards = [];
  double _sliderMax = 100;

  void loadArtboardNames() async {
    final RiveFile riveFile = RiveFile.import(await rootBundle
        .load('assets/multy.riv')); // Create a service for this method

    backgroundArtboards = riveFile.artboards // Mock This get after
        .map((artboard) => artboard.name)
        .where((name) => name.startsWith('tomato_'))
        .toList();
    backgroundArtboards.sort();

    _sliderMax = backgroundArtboards.length.toDouble() - 1;
    emit(0);
    updateSliderValue(0);
  }

  void updateSliderValue(double value) {
    emit(value);
  }

  void emitMaxAndDivisions() {
    emit(_sliderMax);
  }

  double getSliderMax() {
    return _sliderMax;
  }

  int getSliderDivisions() {
    return _sliderMax.toInt();
  }
}
