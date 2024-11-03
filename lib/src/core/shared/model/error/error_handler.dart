class ErrorHandler {
  int statusCode;
  String message;

  ErrorHandler({required this.statusCode, required this.message});

  factory ErrorHandler.empty() => ErrorHandler(
        statusCode: 0,
        message: '',
      );
}
