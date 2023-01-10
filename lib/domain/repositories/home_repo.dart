// import dos modelos
import 'package:advicer/domain/entities/advice_entity.dart';

abstract class HomeRepo {
  Future<AdviceEntity> getAdviceFromDataSource();
}