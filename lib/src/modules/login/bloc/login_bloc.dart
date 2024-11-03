// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/core/domain/repository/auth_repository.dart';
import 'package:flutter_dev_test/src/core/shared/data/state.dart';
import 'package:flutter_dev_test/src/core/shared/model/error/error_handler.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, BaseState> {
  final AuthRepository _auth = Modular.get<AuthRepository>();
  String username = '';
  String password = '';

  LoginBloc() : super(LoadingState()) {
    on<LoginEvent>((event, emit) async {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      emit(SuccessDataState());
      close();
      Modular.to.pushNamed('/login');
    });
  }

  void login() async {
    _auth.user.username = username;
    _auth.user.password = password;

    try {
      final Response result = await _auth.login();
      if (result.statusCode == 200) {
        Modular.to.navigate("/login/home");
      }
    } catch (e) {
      if (e is ErrorHandler) {
        if (e.message == 'Código TOTP inválido') {
          recoverPassword();
        } else {
          emit(ErrorState(message: e.message));
        }
      } else {
        emit(ErrorState(message: 'Erro Desconhecido'));
      }
    }
  }

  void recoverPassword() {
    Modular.to.pushNamed('/login/recover/');
  }
}
