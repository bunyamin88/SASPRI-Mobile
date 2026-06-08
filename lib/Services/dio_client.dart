import 'package:dio/dio.dart';

class DioClient {
  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2:8080/api",
        headers: {
          "Host" : "frontend.test",
        },
        connectTimeout:
            const Duration(seconds: 10),
        receiveTimeout:
            const Duration(seconds: 10),
      ),
    );
  }
}