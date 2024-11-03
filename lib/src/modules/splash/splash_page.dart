import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/core/shared/data/state.dart';
import 'package:flutter_dev_test/src/modules/splash/bloc/splash_bloc.dart';
import 'package:flutter_dev_test/src/modules/splash/bloc/splash_event.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashBloc bloc = Modular.get<SplashBloc>();
  @override
  void initState() {
    bloc.add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Center(
            child: Image.asset(
              'assets/img/login_background_image.png',
              height: 222,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
