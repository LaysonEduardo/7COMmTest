import 'package:flutter_dev_test/src/core/domain/repository/auth_repository.dart';
import 'package:flutter_dev_test/src/modules/home/home_module.dart';
import 'package:flutter_dev_test/src/modules/login/bloc/login_bloc.dart';
import 'package:flutter_dev_test/src/modules/login/login_page.dart';
import 'package:flutter_dev_test/src/modules/recover/recover_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<AuthRepository>(AuthRepository.new);
    i.addLazySingleton<LoginBloc>(LoginBloc.new, config: BindConfig(onDispose: (bloc) => bloc.close()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage(), transition: TransitionType.fadeIn);
    r.module('/home', module: HomeModule(), transition: TransitionType.fadeIn);
    r.module('/recover', module: RecoverModule(), transition: TransitionType.fadeIn);
  }
}
