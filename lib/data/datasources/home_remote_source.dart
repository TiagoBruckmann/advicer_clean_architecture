// imports nativos
import 'dart:convert';

// import dos modelos
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advice_model.dart';

// import dos pacotes
import 'package:http/http.dart' as http;

abstract class HomeRemoteDatasource {

  Future<AdviceModel> getRandomAdviceFromApi();

}

class HomeRemoteSourceImpl implements HomeRemoteDatasource {
  final http.Client client;
  HomeRemoteSourceImpl({ required this.client });

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    Map<String, String> header = {
      "content-Type": "application/json",
    };
    Uri url = Uri.https("api.flutter-community.de","api/v1/advice");
    final response = await client.get(
      url,
      headers: header,
    );

    if ( response.statusCode != 200 ) {
      throw ServerExceptions();
    }

    final responseBody = jsonDecode(response.body);
    return AdviceModel.fromJson(responseBody);
  }

}