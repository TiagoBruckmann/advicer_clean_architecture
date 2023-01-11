// imports nativos
import 'package:flutter/material.dart';

// import dos pacotes
import 'package:flutter_bloc/flutter_bloc.dart';

// import das telas
import 'package:advicer/application/pages/home/home.dart';

// gerencia de estado
import 'package:advicer/application/pages/home/cubit/home_cubit.dart';

// imports globais
import 'package:advicer/injection.dart';

class HomeWrapperProvider extends StatelessWidget {
  const HomeWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (create) => sl<HomeCubit>(),
      child: const Home(),
    );
  }
}
