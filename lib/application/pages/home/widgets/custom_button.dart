// imports nativos
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () {
        print("CLicked InkResponse");
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: themeData.colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 15 ),
            child: Text(
              "Get Advice",
              style: themeData.textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
