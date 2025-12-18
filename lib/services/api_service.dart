import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  static const String baseUrl = 'YOUR_API_BASE_URL';

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = Duration(seconds: 5);
    _dio.options.receiveTimeout = Duration(seconds: 3);
  }

  Future login(String username, String password) async {
    try {
      return await _dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future getLessons() async {
    try {
      return await _dio.get('/lessons');
    } catch (e) {
      rethrow;
    }
  }
}