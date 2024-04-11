import 'package:flutter_test/flutter_test.dart';
import 'package:rive/rive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rivebloc_test/multianimation/cubit/multianimation_cubit.dart';
import 'package:rivebloc_test/multianimation/service/rive_service.dart';

//Mock Class for RiveFile
class MockRiveFile extends Mock implements RiveFile {
  static import(Function<T>({String? named, Matcher? that}) any) {}
}

//Mock Class for RiveService
class MockRiveService extends Mock implements RiveService {}

void main() {
  group('MultianimationCubit', () {
    late MultianimationCubit cubit;
    late RiveFile mockRiveFile;
    late RiveService mockRiveService;

    setUp(() {
      cubit = MultianimationCubit();
      mockRiveFile = MockRiveFile();
      mockRiveService = MockRiveService(); // pass mocked service to the bloc
    });

    tearDown(() {
      cubit.close();
    });

    test('loadArtboardNames sets backgroundArtboards correctly', () async {

      //Simulate artboards
      final artboards = [
        MockArtboard('tomato_1'),
        MockArtboard('tomato_2'),
        MockArtboard('not_tomato_3'),
      ];

      // Add when block with the mocked service
      when(() => mockRiveService.getFile()).thenAnswer((_) async => mockRiveFile);

      when(() => mockRiveFile.artboards).thenReturn(artboards); //Simulate RiveFile

      await cubit.loadArtboardNames(); //Method call

      expect(cubit.backgroundArtboards, [
        'tomato_1',
        'tomato_2'
      ]); //Verify that backgroundArtboards has been correctly configured
    });

    test('updateSliderValue emits correct value', () {
      const value = 5.0;

      cubit.updateSliderValue(value); //Method call

      expect(cubit.state, value); //Verify that the emitted value is correct
    });
  });
}

//Mock Class for Artboard (RiveFile simulation)
class MockArtboard extends Mock implements Artboard {
  @override
  final String name;

  MockArtboard(this.name);

  @override
  String toString() => name; //Override toString to return name
}
