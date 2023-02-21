// import dos data
import 'package:advicer/domain/repositories/home_repo.dart';

// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos modelos
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failure.dart';

class HomeUseCases {
  final HomeRepo homeRepo;
  HomeUseCases({ required this.homeRepo });

  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return homeRepo.getAdviceFromDataSource();
  }

}