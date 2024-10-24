import 'package:dio/dio.dart';

class Utils {
  static String extraErrorMessage(dynamic ex) {
    try {
      if (ex is DioException) {
        var data = ex.response?.data;
        if (data is Map<String, dynamic>) {
          final msg = data['message'];
          if (msg is String) {
            return msg;
          }
        }
      }
    } catch (e) {
      return 'an_error_ocurred';
    }
    return 'an_error_ocurred';
  }
}
