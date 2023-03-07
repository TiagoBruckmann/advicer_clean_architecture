// imports dos app
import 'package:advicer/application/pages/home/cubit/home_cubit.dart';

// import dos domain
import 'package:advicer/domain/usecases/home_usecases.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failure.dart';

// import dos pacotes
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

class MockHomeUseCases extends Mock implements HomeUseCases {

}

void main() {

  group('HomeCubit', () {

    group('Should emit', () {

      MockHomeUseCases mockHomeUseCases = MockHomeUseCases();

      blocTest(
        'Nothing when method is called',
        build: () => HomeCubit(homeUseCases: mockHomeUseCases),
        expect: () => const <HomeCubitState>[],
      );

      blocTest(
        '[HomeCubitStateLoading, HomeCubitStateLoaded] when homeRequestEvent() is called',
        setUp: () => when(() => mockHomeUseCases.getAdvice()).thenAnswer(
          (invocation) => Future.value(
            const Right<Failure, AdviceEntity>(
              AdviceEntity(
                id: 1,
                advice: "advice",
              ),
            ),
          ),
        ),
        build: () => HomeCubit(homeUseCases: mockHomeUseCases),
        act: (cubit) => cubit.homeRequestEvent(),
        expect: () => const <HomeCubitState>[HomeStateLoading(), HomeStateLoaded(advice: 'advice')],
      );

      group('[HomeStateLoading, HomeStateError] when homeRequested() is called', () {

        blocTest(
          'and a ServerFailure occurs',
          setUp: () => when(() => mockHomeUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Left<Failure, AdviceEntity>(
                ServerFailure(),
              ),
            ),
          ),
          build: () => HomeCubit(homeUseCases: mockHomeUseCases),
          act: (cubit) => cubit.homeRequestEvent(),
          expect: () => const <HomeCubitState>[
            HomeStateLoading(),
            HomeStateError(message: serverFailureMessage),
          ],
        );

        blocTest(
          'and a CacheFailure occurs',
          setUp: () => when(() => mockHomeUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Left<Failure, AdviceEntity>(
                CacheFailure(),
              ),
            ),
          ),
          build: () => HomeCubit(homeUseCases: mockHomeUseCases),
          act: (cubit) => cubit.homeRequestEvent(),
          expect: () => const <HomeCubitState>[
            HomeStateLoading(),
            HomeStateError(message: cacheFailureMessage),
          ],
        );

        blocTest(
          'and a GeneralFailure occurs',
          setUp: () => when(() => mockHomeUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Left<Failure, AdviceEntity>(
                GeneralFailure(),
              ),
            ),
          ),
          build: () => HomeCubit(homeUseCases: mockHomeUseCases),
          act: (cubit) => cubit.homeRequestEvent(),
          expect: () => const <HomeCubitState>[
            HomeStateLoading(),
            HomeStateError(message: generalFailureMessage),
          ],
        );

      });

    });

  });

}