// imports nativos
import 'package:advicer/application/core/services/theme_services.dart';
import 'package:advicer/application/pages/home/cubit/home_cubit.dart';
import 'package:advicer/application/pages/home/widgets/error_message.dart';
import 'package:advicer/application/pages/home/widgets/home_field.dart';
import 'package:flutter/material.dart';

// import das telas
import 'package:advicer/application/pages/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import dos pacotes
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:provider/provider.dart';

class MockHomeCubit extends MockCubit<HomeCubitState> implements HomeCubit {}

void main() {

  Widget widgetUnderTest(HomeCubit cubit) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ThemeService(),
        child: BlocProvider<HomeCubit>(
          create: (context) => cubit,
          child: const Home(),
        ),
      ),
    );
  }

  group("HomePage", () {

    late HomeCubit mockHomeCubit;
    setUp(() {
      mockHomeCubit = MockHomeCubit();
    });

    group("should be displayed in ViewState", () {

      testWidgets("Initial when cubits emits HomeInitial()", (widgetTester) async {

        whenListen(
          mockHomeCubit,
          Stream.fromIterable(
            [const HomeInitial()],
          ),
          initialState: const HomeInitial(),
        );
        
        await widgetTester.pumpWidget(widgetUnderTest(mockHomeCubit));
        
        final homeInitialTextFinder = find.text("Your advice is waiting for you!!");

        expect(homeInitialTextFinder, findsOneWidget);

      });

      testWidgets("Loading when cubits emits HomeStateLoading()", (widgetTester) async {

        whenListen(
          mockHomeCubit,
          Stream.fromIterable(
            [const HomeStateLoading()],
          ),
          initialState: const HomeStateLoading(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(mockHomeCubit));
        await widgetTester.pump();

        final homeLoadingFinder = find.byType(CircularProgressIndicator);

        expect(homeLoadingFinder, findsOneWidget);

      });

      testWidgets("advice text when cubits emits HomeStateLoaded()", (widgetTester) async {

        whenListen(
          mockHomeCubit,
          Stream.fromIterable(
            [const HomeStateLoaded(advice: "42")],
          ),
          initialState: const HomeInitial(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(mockHomeCubit));
        await widgetTester.pump();

        final homeLoadedTextFinder = find.byType(HomeField);
        final adviceText = widgetTester.widget<HomeField>(homeLoadedTextFinder).advice;

        expect(homeLoadedTextFinder, findsOneWidget);
        expect(adviceText, "42");

      });

      testWidgets("Error when cubits emits HomeStateError()", (widgetTester) async {

        whenListen(
          mockHomeCubit,
          Stream.fromIterable(
            [const HomeStateError(message: "Error")],
          ),
          initialState: const HomeInitial(),
        );

        await widgetTester.pumpWidget(widgetUnderTest(mockHomeCubit));
        await widgetTester.pump();

        final homeErrorFinder = find.byType(ErrorMessage);
        final errorText = widgetTester.widget<ErrorMessage>(homeErrorFinder).message;

        expect(homeErrorFinder, findsOneWidget);
        expect(errorText, "Error");

      });

    });

  });

}