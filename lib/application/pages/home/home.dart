// imports nativos
import 'package:advicer/application/pages/home/widgets/custom_button.dart';
import 'package:advicer/application/pages/home/widgets/error_message.dart';
import 'package:advicer/application/pages/home/widgets/home_field.dart';
import 'package:flutter/material.dart';

// import das telas
import 'package:advicer/application/core/services/theme_services.dart';

// import dos pacotes
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advicer",
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkMode,
            onChanged: (bool value) => Provider.of<ThemeService>(context, listen: false).toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 50 ),
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: ErrorMessage(message: "This is an error message"),
                /*
                HomeField(
                  advice: "Example advice - your day be a very good!",
                ),
                CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                )
                Text(
                  "Your advice is waiting for you!!",
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headline1,
                ),
                */
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
