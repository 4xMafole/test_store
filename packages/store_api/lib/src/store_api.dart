import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_api/src/models/models.dart';

/// This class provides a Dart client for the Fake Store API.
class FakeStoreApiClient {
  final String _baseUrl = 'https://fakestoreapi.com';

  /// Returns a list of products from the Fake Store API.
  ///
  /// Throws an exception if the API call fails.
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));
      final productJson =
          jsonDecode(response.body) as List<Map<String, dynamic>>;
      return productJson.map((e) => e as Product).toList();
    } catch (_) {
      throw Exception('Failed to load products');
    }
  }
}
