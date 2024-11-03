import 'package:flutter_dev_test/src/modules/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: SplashModule());
  }
}
