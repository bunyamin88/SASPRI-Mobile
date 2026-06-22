import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../services/dio_client.dart';

final dioProvider =
    Provider<Dio>((ref) {

  final dio = DioClient.create();

  return dio;
});