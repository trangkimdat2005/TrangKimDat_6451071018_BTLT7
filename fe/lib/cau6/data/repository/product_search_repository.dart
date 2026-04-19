import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_search.dart';

class ProductSearchRepository {
  static const String _baseUrl = 'https://dummyjson.com/products';

  Future<List<ProductSearch>> fetchAllProducts() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?limit=100'),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json',
        'Accept-Encoding': 'identity',
      },
    );

    if (response.statusCode == 200) {
      final bodyString = utf8.decode(response.bodyBytes);
      final jsonData = json.decode(bodyString);
      final List<dynamic> productList = jsonData['products'] ?? [];
      return productList.map((json) => ProductSearch.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
