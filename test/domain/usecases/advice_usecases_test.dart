// import dos testes
import 'advice_usecases_test.mocks.dart';

// import dos domain
import 'package:advicer/domain/usecases/home_usecases.dart';
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failure.dart';

// import dos data
import 'package:advicer/data/repositories/home_repo_impl.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<HomeRepoImpl>()])
void main() {

  group('AdviceUseCases', () {

    final mockHomeRepoImpl = MockHomeRepoImpl();
    final homeUseCaseTest = HomeUseCases(homeRepo: mockHomeRepoImpl);

    group('should return AdviceEntity', () {

      test('when AdviceRepoImpl return an AdviceEntity', () async {

        when(
          mockHomeRepoImpl.getAdviceFromDataSource(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            const Right(
              AdviceEntity(
                id: 32,
                advice: "Test",
              ),
            ),
          ),
        );

        final result = await homeUseCaseTest.getAdvice();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, const Right<Failure, AdviceEntity>(AdviceEntity(id: 32, advice: "Test")));
        verify(mockHomeRepoImpl.getAdviceFromDataSource()).called(1);

        // when you want to check if a method was not call use verifyNever(mock.methodCall) instead .called(0);
        // verifyNever(mockHomeRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockHomeRepoImpl);

      });

    });

    group('should return left with', () {

      test('a ServerFailure', () async {

        when(
          mockHomeRepoImpl.getAdviceFromDataSource(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(ServerFailure()),
          ),
        );

        final result = await homeUseCaseTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockHomeRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockHomeRepoImpl);

      });

      test('a GeneralFailure', () async {

        when(
          mockHomeRepoImpl.getAdviceFromDataSource(),
        ).thenAnswer(
          (realInvocation) => Future.value(
            Left(GeneralFailure()),
          ),
        );

        final result = await homeUseCaseTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
        verify(mockHomeRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockHomeRepoImpl);

      });

    });

  });

}