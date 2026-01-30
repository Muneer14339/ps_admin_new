import 'package:equatable/equatable.dart';

abstract class ApiException extends Equatable implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class NetworkException extends ApiException {
  const NetworkException(super.message, {super.statusCode});

  @override
  String toString() => message;
}

class ServerException extends ApiException {
  const ServerException(super.message, {super.statusCode});

  @override
  String toString() => message;
}

class ValidationException extends ApiException {
  const ValidationException(super.message, {super.statusCode});

  @override
  String toString() => message;
}

class AuthenticationException extends ApiException {
  const AuthenticationException(super.message, {super.statusCode});

  @override
  String toString() => message;
}

class TimeoutException extends ApiException {
  const TimeoutException(super.message, {super.statusCode});

  @override
  String toString() => message;
}

class UnknownException extends ApiException {
  const UnknownException(super.message, {super.statusCode});

  @override
  String toString() => message;
}
