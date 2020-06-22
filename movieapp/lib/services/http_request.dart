import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeout,
  );
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
                              String method = "get",
                              Map<String, dynamic> params}) async {
    // 1. create customized setting
    final options = Options(method: method);

    // 2. send net request
    try {
      Response response =  await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}
