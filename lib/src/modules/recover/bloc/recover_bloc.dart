import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/core/domain/repository/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoverBloc extends Cubit<String> {
  final AuthRepository _auth = Modular.get<AuthRepository>();
  RecoverBloc() : super('');

  void setOTP(String value) => emit(value);
  Future<dynamic> sendOTP() async {
    try {
      _auth.user.code = state;
      await _auth.recoverOTP();
      Modular.to.pop();
    } catch (e) {
      return e;
    }
  }
}
