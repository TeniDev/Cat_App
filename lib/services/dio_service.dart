import 'package:dio/dio.dart';

abstract class DioService {
  static final Dio _dio = Dio();

  Future<dynamic> getAllData(String url, {String? authorization}) async {
    try {
      if (authorization != null) {
        final data = await _dio.get(
          url,
          options: Options(
            headers: {'Authorization': authorization},
          ),
        );

        return data.data;
      } else {
        final data = await _dio.get(url);

        return data.data;
      }
    } on DioError {
      rethrow;
    }
  }
}
