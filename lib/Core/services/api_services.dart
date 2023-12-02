import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  final baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Response> post(
      {
        Map<String, String>? headers,
      required body,
      required String url,
      required String token,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: contentType,
            headers: headers ??
                {

                  'Authorization': 'Bearer $token'
                }));
    return response;
  }
}
