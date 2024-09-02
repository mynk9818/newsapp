import 'package:dio/dio.dart';

class NewsRepo {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> fetchApi() async {
    const url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=38fc288625de45428ea5e96653d20a6f";

    final response = await dio.get(url);

    return response.data;
  }
}
