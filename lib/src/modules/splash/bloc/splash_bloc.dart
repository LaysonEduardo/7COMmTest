import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/src/core/domain/services/http/dio/dio_services.dart';
import 'package:flutter_dev_test/src/core/domain/services/http/http_service.dart';
import 'package:flutter_dev_test/src/core/shared/data/state.dart';
import 'package:flutter_dev_test/src/modules/splash/bloc/splash_event.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashBloc extends Bloc<SplashEvent, BaseState> {
  final HttpServices _httpServices = Modular.get<DioServices>();

  SplashBloc() : super(LoadingState()) {
    on<FetchData>((event, emit) async {
      // Little delay to have a feedback
      await Future.delayed(
        const Duration(seconds: 1),
      );

      _httpServices.init();

      emit(SuccessDataState());
      Modular.to.navigate('/login/');
    });
  }
}
