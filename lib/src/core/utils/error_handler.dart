// -------------------------------------------------- handleDioError

import 'dart:developer';

import 'package:dio/dio.dart';

String handleDioError(DioException error) {
  String errorMessage = "Something went wrong.";
  String errorType = "Unknown Error";
  int? statusCode;

  if (error.response != null) {
    statusCode = error.response?.statusCode;
    errorMessage = error.response?.data ?? "No error message provided";
  }
  log('handleDioError errortype :: ${error.type}');

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      errorType = "Connection Timeout";
      errorMessage = "Connection timeout with the server.";
      break;
    case DioExceptionType.sendTimeout:
      errorType = "Send Timeout";
      errorMessage = "Send timeout in connection with the server.";
      break;
    case DioExceptionType.receiveTimeout:
      errorType = "Receive Timeout";
      errorMessage = "Receive timeout in connection with the server.";
      break;
    case DioExceptionType.badResponse:
      errorType = "Response Error";
      errorMessage = "Received an invalid status code: $statusCode";
      break;
    case DioExceptionType.cancel:
      errorType = "Request Cancelled";
      errorMessage = "Request to the server was cancelled.";
      break;
    case DioExceptionType.badCertificate:
      errorType = "Bad Certificate Error";
      errorMessage = error.message ?? '';
      break;
    case DioExceptionType.connectionError:
      errorType = "Connection Error";
      errorMessage = error.message ?? '';
      break;
    case DioExceptionType.unknown:
      errorType = "Unexpected Error";
      errorMessage = error.message ?? '';
      break;
  }

  return "Error Type: $errorType\nStatus Code: ${statusCode ?? 'Unknown'}\nMessage: $errorMessage";
}
