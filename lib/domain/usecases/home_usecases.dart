// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos modelos
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failure.dart';

class HomeUseCases {

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    // call a repository to get data

    // manipulate data
    AdviceEntity adviceEntity = const AdviceEntity(15, "Fake advice to test!");

    // return the data
    await Future.delayed(const Duration(seconds: 3), (){});

    // call to repo went good -> return the data
    return right(adviceEntity);

    // call to repo went bad or logic had an error -> return failure
    // return left(ServerFailure());
    // return left(CacheFailure());
    // return left(GeneralFailure());
  }

}