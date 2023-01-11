// import dos data
import 'package:advicer/data/repositories/home_repo_impl.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos modelos
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failure.dart';

class HomeUseCases {

  final _homeRepo = HomeRepoImpl();

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return _homeRepo.getAdviceFromDataSource();

    // space for business logic
  }

}