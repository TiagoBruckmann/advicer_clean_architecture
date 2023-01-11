// import dos data
import 'package:advicer/data/datasources/home_remote_source.dart';

// import dos domain
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/repositories/home_repo.dart';
import 'package:advicer/domain/failures/failure.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{

  final HomeRemoteDatasource _homeRemoteDatasource = HomeRemoteSourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    final result = await _homeRemoteDatasource.getRandomAdviceFromApi();
    return right(result);
  }

}