import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class NewsRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const Duration _timeout = Duration(seconds: 30);

  Future<List<News>> fetchNews() async {
    try {
      final client = http.Client();

      try {
        final response = await client.get(
          Uri.parse('$_baseUrl/posts'),
          headers: {
            'Accept': 'application/json',
          },
        ).timeout(_timeout);

        if (response.statusCode == 200) {
          final List<dynamic> jsonList = json.decode(response.body);
          return jsonList.map((json) => News.fromJson(json)).toList();
        } else {
          throw Exception('Server lỗi: ${response.statusCode}');
        }
      } finally {
        client.close();
      }
    } catch (e) {
      if (e.toString().contains('SocketException') ||
          e.toString().contains('HandshakeException')) {
        throw Exception('Không có kết nối mạng. Vui lòng kiểm tra WiFi/Mobile data.');
      }
      throw Exception('Lỗi: $e');
    }
  }
}
