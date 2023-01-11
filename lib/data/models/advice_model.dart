// import dos entity
import 'package:advicer/domain/entities/advice_entity.dart';

// import dos pacotes
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {

  AdviceModel( int id, String advice ) : super(id: id, advice: advice);

  factory AdviceModel.fromJson( Map<String, dynamic> json ) {
    return AdviceModel(
      json["advice_id"],
      json["advice"],
    );
  }

}