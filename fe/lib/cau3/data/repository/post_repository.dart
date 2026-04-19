import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class PostRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<Post> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json',
        'Accept-Encoding': 'identity',
      },
      body: jsonEncode({'title': title, 'body': body, 'userId': userId}),
    );

    if (response.statusCode == 201) {
      final bodyString = utf8.decode(response.bodyBytes);
      return Post.fromJson(json.decode(bodyString));
    } else {
      throw Exception('Failed to create post: ${response.statusCode}');
    }
  }
}
