import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/product_model.dart';

class ProductRepo {
  final SupabaseClient supabase;

  ProductRepo(this.supabase);

  Future<List<ProductModel>> getProducts() async {
    final response = await supabase.from('products').select();

    return (response as List)
        .map(
          (product) => ProductModel.fromJson(product as Map<String, dynamic>),
        )
        .toList();
  }
}
