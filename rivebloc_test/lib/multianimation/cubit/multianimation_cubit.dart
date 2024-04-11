import 'package:bloc/bloc.dart';
import 'package:rive/rive.dart';
import 'package:rivebloc_test/multianimation/cubit/multianimation_state.dart';
import 'package:rivebloc_test/multianimation/service/rive_service.dart';

/*class MultianimationState {
  final List<String> backgroundArtboards;
  final double sliderMax;

  MultianimationState(this.backgroundArtboards, this.sliderMax);

  MultianimationState copyWith({List<String>? backgroundArtboards, double? sliderMax}) {
    return MultianimationState(
      backgroundArtboards ?? this.backgroundArtboards,
      sliderMax ?? this.sliderMax,
    );
  }
}*/

class MultianimationCubit extends Cubit<MultianimationState> {
  late final RiveService _service;

  MultianimationCubit([RiveService ? service])
  : _service = service ?? RiveService(),
  super(MultianimationState([], 0));

  //List<String> backgroundArtboards = [];
  //double _sliderMax = 100;

  Future<void> loadArtboardNames() async {
    final RiveFile riveFile = _service.getFile();
  
    List<String>backgroundArtboards = riveFile.artboards
        .map((artboard) => artboard.name)
        .where((name) => name.startsWith('tomato_'))
        .toList();
    backgroundArtboards.sort();
    
    double sliderMax = backgroundArtboards.length.toDouble() - 1;
    //emit(0);
    emit(MultianimationState(backgroundArtboards, sliderMax));
    updateSliderValue(0);
  }

  void updateSliderValue(double value) {
    //emit(value);
    emit(state.copyWith(sliderMax: value));
  }

  void emitMaxAndDivisions() {
    //emit(_sliderMax);
    emit(state.copyWith());
  }

  double getSliderMax() {
    return state.sliderMax;
  }

  int getSliderDivisions() {
    return state.sliderMax.toInt();
  }
}