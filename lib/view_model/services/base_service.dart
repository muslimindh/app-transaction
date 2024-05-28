part of '../viewmodels.dart';

String baseURL = 'https://test-muslimin.bintangmfhd.com';

class BaseNetwork {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
    ),
  );

  Future<Response<dynamic>> request(
    String path, {
    String requestMethod = 'get',
    dynamic data,
    Map<String, dynamic>? queryParameter,
    String contentTypeHeader = 'application/json',
  }) async {
    late Response resp;
    _dio.options.headers['Content-Type'] = contentTypeHeader;
    try {
      resp = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameter,
        options: Options(
          method: requestMethod,
          validateStatus: (int? status) => status! <= 500,
          followRedirects: false,
        ),
      );
    } catch (e) {
      debugPrint('$e');
      throw Exception('Terjadi kesalahan server');
    }
    return resp;
  }
}
