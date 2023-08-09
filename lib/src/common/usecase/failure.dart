import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';

abstract class Failure extends Equatable {
  const Failure({this.key = 'Server Error', this.message, this.status});

  final String key;
  final String? message;
  final int? status;

  @override
  List<Object?> get props => [key, message, status];
}

class ServerFailure extends Failure {
  const ServerFailure({String? errorMessage}) : super(message: errorMessage);

  factory ServerFailure.fromDioError(DioError error, {String? message}) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure(errorMessage: L10n.current.connectTimeout);
      case DioErrorType.sendTimeout:
        return ServerFailure(errorMessage: L10n.current.connectTimeout);
      case DioErrorType.receiveTimeout:
        return ServerFailure(errorMessage: L10n.current.receiveTimeout);
      case DioErrorType.response:
      case DioErrorType.cancel:
      case DioErrorType.other:
        return ServerFailure(errorMessage: message ?? error.message);
    }
  }

  @override
  String toString() {
    return message ?? super.toString();
  }
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.message});
}
