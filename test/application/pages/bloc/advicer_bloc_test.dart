// imports dos app
import 'package:advicer/application/pages/home/bloc/home_bloc.dart';

// import dos pacotes
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('HomeBloc', () {

    group('Should emits', () {

      blocTest<HomeBloc, HomeState>(
        'nothing when no event is added',
        build: () => HomeBloc(),
        expect: () => const <HomeState>[],
      );

      blocTest(
        '[HomeStateLoading, HomeStateError] when HomeRequestEvent is added',
        build: () => HomeBloc(),
        act: (bloc) => bloc.add(HomeRequestEvent()),
        wait: const Duration(seconds: 3),
        expect: () => <HomeState>[
          HomeStateLoading(),
          HomeStateError(message: "Error message"),
        ],
      );

    });

  });

}