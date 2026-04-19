import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductRepository {
  static const String _baseUrl = 'https://fakestoreapi.com/products/1';

  Future<Product> fetchProduct() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final bodyString = utf8.decode(response.bodyBytes);
        final jsonData = json.decode(bodyString);

        if (jsonData is Map && jsonData.containsKey('product')) {
          return Product.fromJson(jsonData['product']);
        }

        return Product.fromJson(jsonData);
      } else {
        throw Exception('Không thể tải sản phẩm: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Lỗi kết nối: $e');
    }
  }
}
