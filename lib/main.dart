// imports nativos
import 'package:flutter/material.dart';

// import dos temas
import 'package:advicer/themes.dart';

// import dos pacotes
import 'package:provider/provider.dart';

// import das telas
import 'package:advicer/application/pages/home/home.dart';
import 'application/core/services/theme_services.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (create) => ThemeService(),
      child: Consumer<ThemeService>(
        builder: ( context, themeService, child ) {
          return MaterialApp(
            themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            title: 'Advicer',
            home: const Home(),
          );
        },
      ),
    ),
  );
}