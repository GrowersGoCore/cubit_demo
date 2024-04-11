import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multianimation/service/rive_service.dart';

class MultianimationCubit extends Cubit<double> {
  late final RiveService _service;

  MultianimationCubit([RiveService ? service]) : _service = service ?? RiveService(), super(0);

  List<String> backgroundArtboards = [];
  double _sliderMax = 100;


  Future<void> loadArtboardNames() async {
    final RiveFile riveFile = _service.getFile();
  
    backgroundArtboards = riveFile.artboards
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