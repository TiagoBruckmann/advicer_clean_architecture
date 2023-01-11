abstract class Failure {

  final String message = "";

}

class ServerFailure extends Failure {

}

class CacheFailure extends Failure {

}

class GeneralFailure extends Failure {}