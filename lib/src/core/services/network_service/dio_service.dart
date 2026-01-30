import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/services/network_service/endpoints.dart';

import '../local_storage_service/local_storage_service.dart';

class DioService {
  Dio dio = Dio();

  Map<String, String> setHeaderWithOutToken() {
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    return q;
  }

  Map<String, String> setHeaderWithToken() {
    final store = locator<LocalStorageService>();
    String id = store.userIdString;
    String tkn = store.getUserLoginToken ?? '';
    print("WITH_ID========= $id");
    print("WITH_TOKEN========= $tkn");
    Map<String, String> q = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Token $tkn',
    };
    return q;
  }

  Future<Response?> dioPost(
      {String? url,
      String? fullUrl,
      bool useToken = true,
      var obj,
      bool post = true}) async {
    Map<String, String> headers;
    if (useToken) {
      headers = setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response;
      if (post) {
        log("dioPost response: ....1");
        log("dioPost url: ${fullUrl ?? (baseUrl + (url ?? ''))} - response:");
        response = await dio.post(fullUrl ?? (baseUrl + (url ?? '')),
            data: obj, options: Options(headers: headers));
        log("dioPost url: ${fullUrl ?? (baseUrl + (url ?? ''))} - response: ${response.statusCode}");
        log('dioPost response.data  ${response.data}');
      } else {
        response = await dio.put(fullUrl ?? (baseUrl + (url ?? '')),
            data: obj, options: Options(headers: headers));
      }
      log('dioPost res data ${response.data}');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // DioErrorType.RESPONSE refers to errors received from the server
        log('dioPost Error response status code: ${e.response?.statusCode}');
        log('dioPost Error response data: ${e.response?.data}');
        return e.response;
      } else {
        // DioErrorType.DEFAULT refers to network-related errors
        log('dioPost Network error: $e');
        return Response(
          data: {
            'message': 'Something went wrong. Check your internet connection'
          },
          requestOptions: RequestOptions(),
        );
      }
    }
  }

  //

  Future<Response?> dioGet({
    String? url,
    String? fullUrl,
    bool useToken = true,
    var obj,
  }) async {
    Map<String, String> headers;
    if (useToken) {
      headers = setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response;
      print("response: ....1");
      print("url: ${fullUrl ?? (baseUrl + (url ?? ''))} - response:");
      response = await dio.get(fullUrl ?? (baseUrl + (url ?? '')),
          data: obj, options: Options(headers: headers));
      print(
          "url: ${fullUrl ?? (baseUrl + (url ?? ''))} - response: ${response.statusCode}");
      print(response.data);

      log('res data ${response.data}');
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        // DioErrorType.RESPONSE refers to errors received from the server
        print('Error response status code: ${e.response?.statusCode}');
        print('Error response data: ${e.response?.data}');
      } else {
        // DioErrorType.DEFAULT refers to network-related errors
        print('Network error: $e');
      }
      return e.response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> dioDelete({
    String? url,
    String? fullUrl,
    bool useToken = true,
    var obj,
  }) async {
    Map<String, String> headers;
    if (useToken) {
      headers = setHeaderWithToken();
    } else {
      headers = setHeaderWithOutToken();
    }
    try {
      Response response;
      print("🌐 [DioService-DELETE] ========== START DELETE REQUEST ==========");
      print("🌐 [DioService-DELETE] URL: ${fullUrl ?? (baseUrl + (url ?? ''))}");
      print("🌐 [DioService-DELETE] Headers: $headers");
      print("🌐 [DioService-DELETE] Body: $obj");
      print("🌐 [DioService-DELETE] Sending DELETE request...");

      log("dioDelete response: ....1");
      log("dioDelete url: ${fullUrl ?? (baseUrl + (url ?? ''))}");

      response = await dio.delete(fullUrl ?? (baseUrl + (url ?? '')),
          data: obj, options: Options(headers: headers));

      print("🟢 [DioService-DELETE] SUCCESS - Status: ${response.statusCode}");
      print("🟢 [DioService-DELETE] Response Data: ${response.data}");

      log("dioDelete url: ${fullUrl ?? (baseUrl + (url ?? ''))} - response: ${response.statusCode}");
      log('dioDelete response.data  ${response.data}');
      return response;
    } on DioException catch (e) {
      print("🔴 [DioService-DELETE] DioException caught!");
      print("🔴 [DioService-DELETE] Exception type: ${e.type}");
      print("🔴 [DioService-DELETE] Exception message: ${e.message}");
      print("🔴 [DioService-DELETE] Exception error: ${e.error}");

      if (e.response != null) {
        print("🔴 [DioService-DELETE] Server Response - Status: ${e.response?.statusCode}");
        print("🔴 [DioService-DELETE] Server Response - Data: ${e.response?.data}");
        print("🔴 [DioService-DELETE] Server Response - Headers: ${e.response?.headers}");

        log('dioDelete Error response status code: ${e.response?.statusCode}');
        log('dioDelete Error response data: ${e.response?.data}');
        return e.response;
      } else {
        print("🔴 [DioService-DELETE] NO RESPONSE from server - Network error");
        print("🔴 [DioService-DELETE] Possible causes:");
        print("   - No internet connection");
        print("   - Server is down");
        print("   - Timeout");
        print("   - DNS resolution failed");

        log('dioDelete Network error: $e');
        return Response(
          data: {
            'message': 'Something went wrong. Check your internet connection'
          },
          requestOptions: RequestOptions(),
        );
      }
    } catch (e) {
      print("🔴 [DioService-DELETE] Generic exception caught: $e");
      return null;
    }
  }
}
