// imports nativos
import 'package:flutter/material.dart';

class HomeField extends StatelessWidget {
  const HomeField({ Key? key, required this.advice }) : super(key: key);
  final String advice;

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeData.colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 20 ),
          child: Text(
            '"$advice"',
            textAlign: TextAlign.center,
            style: themeData.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
