// imports do app
import 'package:advicer/application/pages/home/widgets/home_field.dart';
import 'package:advicer/main.dart' as app;

// import dos pacotes
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group("end-to-end test", () {
    
    testWidgets("tap on custom button, verify advice will be loaded", (widgetTester) async {
      
      app.main();
      await widgetTester.pumpAndSettle();
      
      // verify that no advice has been loaded
      expect(find.text("Your advice is waiting for you!!"), findsOneWidget);
      
      // find custom button
      final customButtonFinder = find.text("Get Advice");

      // emulate a tap on the custom button
      await widgetTester.tap(customButtonFinder);

      // trigger a frame and wait until its settled
      await widgetTester.pumpAndSettle();

      // verify that a advice was loaded
      expect(find.byType(HomeField), findsOneWidget);
      expect(find.textContaining('"'), findsOneWidget);
    });

  });
}