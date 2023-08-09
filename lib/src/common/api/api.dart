import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:weather_app/src/common/api/api_endpoints.dart';
import 'package:weather_app/src/common/usecase/failure.dart';

export 'api_endpoints.dart';

class Api {
  static BaseOptions opts = BaseOptions(
    baseUrl: ApiEndpoints.endpoint,
    receiveTimeout: 60000, // Milliseconds
    connectTimeout: 20000, // Milliseconds
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio
      ..interceptors.addAll([
        DioLogInterceptor(),
      ]);
  }

  static final Dio dio = createDio();
  static final Dio baseAPI = addInterceptors(dio);

  Future<Response> get<K>({
    required String endPoint,
    Map<String, K>? query,
  }) async {
    Response response;

    final Map<String, dynamic> headers = {};
    try {
      response = await baseAPI.get(endPoint,
          queryParameters: query, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log('Api catched DioError ${e.type}: response ${e.response} | ${e.message}');
      throw ServerFailure.fromDioError(e, message: e.response?.data?['message']);
    } catch (error) {
      log('Class [Api] | Method [get] | catched error: [$error]');
      rethrow;
    }
  }

  Future<Response?> postHTTP({
    required String endPoint,
    dynamic data,
    Map<String, dynamic> headers = const {},
  }) async {
    Response response;
    try {
      response =
          await baseAPI.post(endPoint, data: data, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log('Api catched DioError ${e.type}: response ${e.response} | ${e.message}');
      throw ServerFailure.fromDioError(e, message: e.response?.data?['message']);
    } catch (error) {
      log('Class [Api] | Method [postHTTP] | catched error: [$error]');
      rethrow;
    }
  }

  Future<Response?> putHTTP({
    required String endPoint,
    required dynamic data,
    Map<String, dynamic> headers = const {},
  }) async {
    Response response;
    try {
      response =
          await baseAPI.put(endPoint, data: data, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log('Api catched DioError ${e.type}: response ${e.response} | ${e.message}');
      throw ServerFailure.fromDioError(e, message: e.response?.data?['message']);
    } catch (error) {
      log('Class [Api] | Method [putHTTP] | catched error: [$error]');
      rethrow;
    }
  }

  Future<Response?> deleteHTTP<K>({
    required String endPoint,
    Map<String, K>? query,
    Map<String, dynamic> headers = const {},
  }) async {
    Response response;
    try {
      response = await baseAPI.delete(endPoint,
          queryParameters: query, options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      log('Api catched DioError ${e.type}: response ${e.response} | ${e.message}');
      throw ServerFailure.fromDioError(e, message: e.response?.data?['message']);
    } catch (error) {
      log('Class [Api] | Method [deleteHTTP] | catched error: [$error]');
      rethrow;
    }
  }
}
