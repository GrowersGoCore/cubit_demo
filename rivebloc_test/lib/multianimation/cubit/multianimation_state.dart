class MultianimationState {

  final List<String> backgroundArtboards;
  final double sliderMax;

  MultianimationState(this.backgroundArtboards, this.sliderMax);

  MultianimationState copyWith({List<String>? backgroundArtboards, double? sliderMax}) {
    return MultianimationState(
      backgroundArtboards ?? this.backgroundArtboards,
      sliderMax ?? this.sliderMax,
    );
  }

}