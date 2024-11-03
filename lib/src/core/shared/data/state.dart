// ignore_for_file: public_member_api_docs, sort_constructors_first
class BaseState {}

class LoadingState extends BaseState {}

class ErrorState extends BaseState {
  final String message;
  ErrorState({
    required this.message,
  });
}

class SuccessState extends BaseState {}

class SuccessDataState extends BaseState {
  dynamic data;
  SuccessDataState({
    this.data,
  });
}
