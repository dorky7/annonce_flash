import 'dart:io';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dio/dio.dart';

class Utils {
  static Future<String?> getIPAddress() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        // Get the list of network interfaces
        for (var interface in await NetworkInterface.list()) {
          for (var addr in interface.addresses) {
            // Return the first IPv4 address (usually the device's IP)
            if (addr.type == InternetAddressType.IPv4) {
              return addr.address;
            }
          }
        }
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  static String extraErrorMessage(dynamic ex) {
    try {
      if (ex is DioException) {
        if (ex.error is SocketException) {
          return 'Check your internet connection';
        }
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
