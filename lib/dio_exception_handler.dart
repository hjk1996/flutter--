import 'package:dio/dio.dart';

class DioExceptionHandler {
  DioExceptionHandler.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.other:
        break;
      case DioErrorType.receiveTimeout:
        break;
      case DioErrorType.response:
        break;
      case DioErrorType.sendTimeout:
        break;
      default:
        break;
    }
  }
}
