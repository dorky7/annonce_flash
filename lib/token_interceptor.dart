import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenInterceptor extends QueuedInterceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['X-AppApiToken'] =
        'aWhhSWlnS1FLY2lNTUhWa2hVMEN5RVZZZkIwTVY5Mkg=';
    options.headers['X-AppType'] = 'mobile_flutter';
    handler.next(options);
  }
}
