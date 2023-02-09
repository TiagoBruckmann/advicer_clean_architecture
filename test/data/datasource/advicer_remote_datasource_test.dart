// import dos test
import 'advicer_remote_datasource_test.mocks.dart';

// import dos data
import 'package:advicer/data/datasources/home_remote_source.dart';
import 'package:advicer/data/exceptions/exceptions.dart';
import 'package:advicer/data/models/advice_model.dart';

// import dos pacotes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdvicerRemoteDatasource', () {

    final mockClient = MockClient();
    final adviceRemoteDataSourceTest = HomeRemoteSourceImpl(client: mockClient);

    group("should return adviceModel", () {
      test("When client response was 200 and has valid data", () async {

        const responseBody = '{"advice": "Test Advice", "advice_id": 1}';
        
        when(
          mockClient.get(
            Uri.https("api.flutter-community.de","api/v1/advice"),
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response(responseBody, 200),
        ));
        
        final result = await adviceRemoteDataSourceTest.getRandomAdviceFromApi();
        
        expect(result, AdviceModel(1, "Test Advice"));

      });
    });

    group('should throw', () {
      test('A serverException when Client response was not 200 and has no valid data', () {

        when(
          mockClient.get(
            Uri.https("api.flutter-community.de","api/v1/advice"),
            headers: {
              "content-Type": "application/json",
            },
          ),
        ).thenAnswer((realInvocation) => Future.value(
          Response('', 404),
        ));

        expect(adviceRemoteDataSourceTest.getRandomAdviceFromApi(), throwsA(isA<ServerExceptions>()));

      });
    });

  });
}