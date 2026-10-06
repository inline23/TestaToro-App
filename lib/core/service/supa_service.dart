import 'package:http/http.dart' as http;

class SupaService {
  static const String _baseUrl = 'https://your-supabase-url.supabase.co';
  static const String _apiKey = 'your-supabase-api-key';

  Future<http.Response> fetchProducts() async {
    final url = Uri.parse('$_baseUrl/rest/v1/products');
    final response = await http.get(
      url,
      headers: {
        'apikey': _apiKey,
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
