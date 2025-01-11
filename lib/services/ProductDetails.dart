import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductDetails {
  final String url = 'https://fakestoreapi.com/products?limit=5';

  Future<List<Map<String, String>>> fetchProductsTitleAndDescription() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> products = json.decode(response.body);
      return products.map((product) {
        return {
          'title': product['title']?.toString() ?? 'No Title',
          'description': product['description']?.toString() ?? 'No Description',
          'image' : product['image']?.toString() ?? 'No Image',
        };
      }).toList();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}