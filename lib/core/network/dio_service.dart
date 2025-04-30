import 'package:dio/dio.dart';

class DioService {
  late final Dio _dio;

  DioService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ Успешно');
          handler.next(response);
        },
        onError: (error, handler) {
          print('❌ Ошибка связанная с ${error.message}');
          print('📦 Ответ от сервера: ${error.response?.data}');
          handler.next(error);
        },
      ),
    );
  }
  Future<Response> post(String endpoint, dynamic data) async {
    final response = await _dio.post(endpoint, data: data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Response> get(String endpoint) async {
    final response = await _dio.get(endpoint);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
