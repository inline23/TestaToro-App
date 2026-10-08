class ProductImageModel {
  final int id;
  final int productId;
  final String imageUrl;
  final int sortOrder;
  final bool isPrimary;

  const ProductImageModel({
    required this.id,
    required this.productId,
    required this.imageUrl,
    this.sortOrder = 0,
    this.isPrimary = false,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json['id'] as int,
      productId: json['product_id'] as int,
      imageUrl: json['image_url'] as String,
      sortOrder: json['sort_order'] as int? ?? 0,
      isPrimary: json['is_primary'] as bool? ?? false,
    );
  }
}
