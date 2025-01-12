import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  final String _url = 'https://fakestoreapi.com/products?limit=8';
  List<Map<String, String>> _products = [];
  bool _isLoading = false;

  List<Map<String, String>> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners(); 
    }
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final List<dynamic> productsData = json.decode(response.body);
        _products = productsData.map((product) {
          return {
            'title': product['title']?.toString() ?? 'No Title',
            'description': product['description']?.toString() ?? 'No Description',
            'image': product['image']?.toString() ?? 'No Image',
          };
        }).toList();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); 
    }
  }
}
