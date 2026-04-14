import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/models/product.dart';

class ProductRepository {
  static const String _baseUrl = 'https://fakestoreapi.com/products/1';

  Future<Product> fetchProduct() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Product.fromJson(json);
    } else {
      throw Exception('Failed to load product: ${response.statusCode}');
    }
  }
}
