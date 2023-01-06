// imports nativos
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({ Key? key, required this.message }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 40,
        ),
        const SizedBox(height: 20),
        Text(
          message,
          textAlign: TextAlign.center,
          style: themeData.textTheme.headline1,
        ),
      ],
    );
  }
}
