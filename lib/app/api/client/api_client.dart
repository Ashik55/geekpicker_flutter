import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:geekpicker_flutter/app/utils/constants.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class ApiClient extends GetxService {
  late Dio _dio;

  static header() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  Future<ApiClient> init() async {
    _dio = Dio(BaseOptions(
      baseUrl: APP_BASE_URL,
      headers: header(),
      connectTimeout: 35000,
      receiveTimeout: 35000,
    ));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      log('REQUEST[${options.method}] => PATH: $APP_BASE_URL${options.path} '
          '=> HEADERS: ${options.headers},'
          '\nQueryParameters : ${options.queryParameters},'
          '\nBodyPayload : ${options.data},');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  Future<dynamic> request(String url, Method method,
      {Map<String, dynamic>? params,
      Map<String, dynamic>? body,
      FormData? formData}) async {
    params?.removeWhere(
        (key, value) => key == null || value == "null" || value == null);
    body?.removeWhere(
        (key, value) => key == null || value == "null" || value == null);
    Response response;
    try {
      if (method == Method.POST) {
        response = await _dio.post(url,
            queryParameters: params, data: formData ?? body);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url, queryParameters: params, data: body);
      } else if (method == Method.PUT) {
        response = await _dio.put(url, queryParameters: params, data: body);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Internal Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch (e) {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      print(e.message);
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }
}
