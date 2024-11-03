import 'package:dio/dio.dart';
import 'package:flutter_dev_test/src/core/domain/services/http/dio/dio_services.dart';
import 'package:flutter_dev_test/src/modules/home/home_module.dart';
import 'package:flutter_dev_test/src/modules/login/login_module.dart';
import 'package:flutter_dev_test/src/modules/splash/bloc/splash_bloc.dart';
import 'package:flutter_dev_test/src/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => DioServices(dio: Dio()));
    i.addLazySingleton<SplashBloc>(SplashBloc.new, config: BindConfig(onDispose: (bloc) => bloc.close()));
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => const SplashPage(),
    );
    r.module(
      '/login',
      module: LoginModule(),
    );
    r.module(
      '/home',
      module: HomeModule(),
    );
  }
}
