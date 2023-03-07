// imports nativos
import 'package:flutter/material.dart';

// import das telas
import 'package:advicer/application/pages/home/widgets/custom_button.dart';

// import dos pacotes
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  
  Widget widgetUnderTest( Function onTap ) {
    return MaterialApp(
      home: Scaffold(
        body: CustomButton(
          onTap: () => onTap,
        ),
      ),
    );
  }

  group("Golden test", () {
    
    group("Custom Button", () {
      
      testWidgets("Is enabled", (widgetTester) async {
        await widgetTester.pumpWidget(widgetUnderTest(() {}));
        
        expectLater(find.byType(CustomButton), matchesGoldenFile("golden/custom_button_enabled.png"));
      });

      testWidgets("Is disable", (widgetTester) async {
        await widgetTester.pumpWidget(widgetUnderTest(() {}));

        expectLater(find.byType(CustomButton), matchesGoldenFile("golden/custom_button_disable.png"));
      });

    });

  });
}