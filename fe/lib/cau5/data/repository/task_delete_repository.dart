import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskDeleteRepository {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?_limit=15'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json',
        'Accept-Encoding': 'identity',
      },
    );

    if (response.statusCode == 200) {
      final bodyString = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonList = json.decode(bodyString);
      return jsonList.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks: ${response.statusCode}');
    }
  }

  Future<void> deleteTask(int id) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/$id'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json',
        'Accept-Encoding': 'identity',
      },
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete task: ${response.statusCode}');
    }
  }
}
