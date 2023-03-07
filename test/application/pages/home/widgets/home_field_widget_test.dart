// imports nativos
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_test/flutter_test.dart';

// import das telas
import 'package:advicer/application/pages/home/widgets/home_field.dart';

void main() {

  Widget widgetUnderTest(String adviceMessage) {
    return MaterialApp(
      home: HomeField(
        advice: adviceMessage,
      ),
    );
  }

  group("HomeField", () {

    group("Should be displayed correctly", () {

      testWidgets("when a short text is given", (widgetTester) async {
        const text = "a";

        await widgetTester.pumpWidget(widgetUnderTest(text));

        // only used when have not animation
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.textContaining("a");

        expect(adviceFieldFinder, findsOneWidget);

      });

      testWidgets("when a long text is given", (widgetTester) async {
        const text = "Hello flutter developers, i hope you enjoy the course, and have a great time. The sun is shining, i have no idea what else i should write here to get a very long message.";

        await widgetTester.pumpWidget(widgetUnderTest(text));

        // only used when have not animation
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.byType(HomeField);

        expect(adviceFieldFinder, findsOneWidget);

      });

      testWidgets("when no text is given", (widgetTester) async {
        const text = "";

        await widgetTester.pumpWidget(widgetUnderTest(text));

        // only used when have not animation
        await widgetTester.pumpAndSettle();

        final adviceFieldFinder = find.text(HomeField.emptyAdvice);
        final adviceText = widgetTester.widget<HomeField>(find.byType(HomeField)).advice;

        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, "");

      });

    });

  });
}