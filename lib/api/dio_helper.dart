import 'package:dio/dio.dart';

import '../utils/constants/constant.dart';

Dio dioHelper() {
  Dio dio = Dio();

 /* dio.options.receiveTimeout = 5000;
  dio.options.connectTimeout = 5000;*/
  dio.options.baseUrl = Constant.apiBaseUrl;

  return dio;
}