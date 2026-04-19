import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_update.dart';

class UserUpdateRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<UserUpdate> fetchUser(int id) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$id'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json',
        'Accept-Encoding': 'identity',
      },
    );

    if (response.statusCode == 200) {
      final bodyString = utf8.decode(response.bodyBytes);
      return UserUpdate.fromJson(json.decode(bodyString));
    } else {
      throw Exception('Failed to load user: ${response.statusCode}');
    }
  }

  Future<UserUpdate> updateUser(UserUpdate user) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/${user.id}'),
      headers: {
        'Content-Type': 'application/json',
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json',
        'Accept-Encoding': 'identity',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final bodyString = utf8.decode(response.bodyBytes);
      return UserUpdate.fromJson(json.decode(bodyString));
    } else {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  }
}
