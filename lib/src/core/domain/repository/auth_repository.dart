import 'package:dio/dio.dart';
import 'package:flutter_dev_test/src/core/domain/services/http/dio/dio_services.dart';
import 'package:flutter_dev_test/src/core/domain/services/http/http_service.dart';
import 'package:flutter_dev_test/src/core/shared/model/error/error_handler.dart';
import 'package:flutter_dev_test/src/core/shared/model/user/user_auth_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:otp/otp.dart';

class AuthRepository {
  final HttpServices _httpService = Modular.get<DioServices>();

  UserAuth user = UserAuth.empty();

  Future login() async {
    try {
      return await _httpService.post('/auth/login', body: user.toJson());
    } catch (e) {
      if (e is DioException) {
        final error = ErrorHandler.empty();
        final data = e.response?.data;

        error.statusCode = e.response?.statusCode ?? 0;
        switch (data['message'] ?? '') {
          case 'Invalid credentials':
            error.message = 'Credenciais inválidas';
          case 'Invalid TOTP code':
            error.message = 'Código TOTP inválido';
          default:
            error.message = 'Erro desconhecido';
        }
        throw error;
      }

      rethrow;
    }
  }

  Future recoverOTP() async {
    try {
      final Response response = await _httpService.post('/auth/recovery-secret', body: user.toJson());
      if (response.statusCode == 200) {
        user.totpCode = generateTOTP(response.data["totp_secret"]);
      }
    } catch (e) {
      if (e is DioException) {
        final error = ErrorHandler.empty();
        final data = e.response?.data;

        error.statusCode = e.response?.statusCode ?? 0;

        switch (data['message'] ?? '') {
          case 'Invalid password':
            error.message = 'Senha inválida';
          case 'Invalid recovery code':
            error.message = 'Código de verificação incorreto';
          case 'User not found':
            error.message = 'Usuário não encontrado';
          default:
            error.message = 'Erro desconhecido';
        }
        throw error;
      }

      rethrow;
    }
  }

  String generateTOTP(secret) {
    return OTP.generateTOTPCodeString(
      secret,
      DateTime.now().millisecondsSinceEpoch,
      interval: 30,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
  }
}
