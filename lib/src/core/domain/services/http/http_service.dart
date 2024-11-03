abstract class HttpServices {
  Future<void> init();

  Future get(String url, {Map<String, dynamic> params = const {}});

  Future post(String url, {Map<String, dynamic>? body});

  Future put(String url, {Map<String, dynamic>? body});

  Future delete(String url);
}
