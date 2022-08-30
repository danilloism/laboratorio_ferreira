abstract class IHttpService {
  String? get authorizationToken;
  resetInterceptorsWithTokenOrNull([String? token]);
  Future post(String path, {dynamic data});
  Future get(String path, {Map<String, dynamic>? queryParams});
  Future put(String path, {dynamic data});
}
