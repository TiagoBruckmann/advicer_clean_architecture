// import dos testes
import 'dart:io';

import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/domain/entities/advice_entity.dart';

import 'advicer_repo_impl_test.mocks.dart';

// import dos domain
import 'package:advicer/domain/failures/failure.dart';

// import dos data
import 'package:advicer/data/datasources/home_remote_source.dart';
import 'package:advicer/data/repositories/home_repo_impl.dart';
import 'package:advicer/data/models/advice_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<HomeRemoteSourceImpl>()])
void main() {

  group('AdviceRepoImpl', () {

    final mockAdviceRemoteDatasource = MockHomeRemoteSourceImpl();
    final adviceRepoImplTest = HomeRepoImpl(homeRemoteDatasource: mockAdviceRemoteDatasource);

    group('should return AdviceEntity', () {

      test('when adviceRemoteDatasource return a AdviceModel', () async {

        when(
          mockAdviceRemoteDatasource.getRandomAdviceFromApi(),
        ).thenAnswer(
          (realInvocation) => Future.value(AdviceModel(22, "Test")),
        );

        final result = await adviceRepoImplTest.getAdviceFromDataSource();
        
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result, Right<Failure, AdviceModel>(AdviceModel(22, "Test")));
        verify(mockAdviceRemoteDatasource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDatasource);

      });

    });

    group('should return left with', () {

      test('A serverFailure when a ServerException occurs', () async {

        when(
          mockAdviceRemoteDatasource.getRandomAdviceFromApi(),
        ).thenThrow(ServerExceptions());

        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));

      });

      test('A GeneralFailure on all another exceptions', () async {

        when(
          mockAdviceRemoteDatasource.getRandomAdviceFromApi(),
        ).thenThrow(
          const SocketException("Test"),
        );

        final result = await adviceRepoImplTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));

      });

    });

  });

}