import 'package:dio/dio.dart';
import '../http_service.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class DioServices extends HttpServices {
  final Dio dio;
  // All things related to DioAdapter is for testing purpose only
  late DioAdapter adapter;

  final String apiBaseUrl = 'http://10.0.2.2:5000';

  DioServices({required this.dio});

  @override
  Future<void> init() async {
    dio.options.baseUrl = apiBaseUrl;
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic> params = const {},
  }) async {
    return await dio.get(
      url,
      queryParameters: params,
    );
  }

  @override
  Future<Response> post(String url, {Map<String, dynamic>? body}) async {
    return await dio.post(
      url,
      data: body,
    );
  }

  @override
  Future<Response> put(String url, {Map<String, dynamic>? body}) async {
    return await dio.put(
      url,
      data: body,
    );
  }

  @override
  Future delete(String url) async {
    return await dio.delete(url);
  }
}
