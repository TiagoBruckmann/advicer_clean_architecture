// import dos modelos
import 'package:advicer/domain/entities/advice_entity.dart';

class HomeUseCases {

  Future<AdviceEntity> getAdvice() async {
    // call a repository to get data

    // manipulate data
    AdviceEntity adviceEntity = const AdviceEntity(15, "Fake advice to test!");

    // return the data
    await Future.delayed(const Duration(seconds: 3), (){});
    return adviceEntity;
  }

}