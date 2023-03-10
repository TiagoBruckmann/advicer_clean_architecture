// import dos data
import 'package:advicer/data/datasources/home_remote_source.dart';
import 'package:advicer/data/exceptions/exceptions.dart';

// import dos domain
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/repositories/home_repo.dart';
import 'package:advicer/domain/failures/failure.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  final HomeRemoteDatasource homeRemoteDatasource;
  HomeRepoImpl({ required this.homeRemoteDatasource });

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await homeRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerExceptions {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

}