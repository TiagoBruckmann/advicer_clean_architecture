// import dos pacotes
import 'package:dartz/dartz.dart';

// import dos modelos
import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:advicer/domain/failures/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}