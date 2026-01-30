import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../services/network_service/endpoints.dart';
import 'exceptions.dart';

@singleton
class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add authentication token if available
          // final token = _getToken();
          // if (token != null) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }

          // Log request
          print('REQUEST: ${options.method} ${options.path}');
          if (options.data != null) {
            print('REQUEST DATA: ${options.data}');
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          // Log response
          print(
            'RESPONSE: ${response.statusCode} ${response.requestOptions.path}',
          );
          if (response.data != null) {
            print('RESPONSE DATA: ${response.data}');
          }
          handler.next(response);
        },
        onError: (error, handler) {
          // Log error
          print('ERROR: ${error.message}');
          print('ERROR RESPONSE: ${error.response?.data}');

          // Convert Dio error to custom exception
          final exception = _handleError(error);
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: exception,
              response: error.response,
              type: error.type,
            ),
          );
        },
      ),
    );
  }

  ApiException _handleError(DioException error) {
    // print('_____________________ ${error.type}');
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException('Request timeout');

      case DioExceptionType.connectionError:
        return const NetworkException('No internet connection');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        print('_____________________ ${error.response?.data?['error']}');
        print('_____________________ ${error.response?.statusMessage}');
        print('_____________________ $error');
        final message =
            error.response?.data?['error'] ??
                error.response?.data?['message'] ??
                error.response?.statusMessage ??
                'Unknown error occurred';

        switch (statusCode) {
          case 400:
            return ValidationException(message);
          case 401:
            return AuthenticationException(message);
          case 403:
            return AuthenticationException(message);
          case 404:
            return ServerException(message, statusCode: statusCode);
          case 422:
            return ValidationException(message);
          case 500:
            return ServerException(message, statusCode: statusCode);
          default:
            return ServerException(message, statusCode: statusCode);
        }

      case DioExceptionType.cancel:
        return const NetworkException('Request cancelled');

      case DioExceptionType.unknown:
        return UnknownException(error.message ?? 'Unknown error occurred');

      default:
        return UnknownException(error.message ?? 'Unknown error occurred');
    }
  }

  // HTTP Methods
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      Response<T> res = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      print('\n endpoint: $path\n\nGET Response:\n\n${res.data}');
      return res;
    } on DioException catch (e) {
      throw e.error ?? UnknownException(e.message ?? 'Unknown error');
    }
  }

  Future<Response<T>> post<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      Response<T> res = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      print('\n endpoinst: $path\n\nPOST Response:\n\n${res.data}');
      return res;
    } on DioException catch (e) {
      throw e.error ?? UnknownException(e.message ?? 'Unknown error');
    }
  }

  Future<Response<T>> put<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      Response<T> res = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      print('\n endpoint: $path\n\nPUT Response:\n\n${res.data}');
      return res;
    } on DioException catch (e) {
      throw e.error ?? UnknownException(e.message ?? 'Unknown error');
    }
  }

  Future<Response<T>> delete<T>(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    try {
      Response<T> res = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      print('\n endpoint: $path\n\nDELETE Response:\n\n${res.data}');
      return res;
    } on DioException catch (e) {
      throw e.error ?? UnknownException(e.message ?? 'Unknown error');
    }
  }

  // Update authorization header
  void updateAuthToken(String? token) {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  // Get current Dio instance for advanced usage
  Dio get dio => _dio;
}
