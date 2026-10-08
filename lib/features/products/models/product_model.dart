import 'product_image_model.dart';

class ProductModel {
  final int id;
  final int? categoryId;
  final String name;
  final String? description;
  final double basePrice;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ProductImageModel> images;

  const ProductModel({
    required this.id,
    this.categoryId,
    required this.name,
    this.description,
    required this.basePrice,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    this.images = const [],
  });

  /// The primary image if there is one, otherwise the first by sort order.
  String? get primaryImageUrl {
    if (images.isEmpty) return null;
    return images
        .firstWhere((img) => img.isPrimary, orElse: () => images.first)
        .imageUrl;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final images = ((json['product_images'] as List?) ?? [])
        .map((e) => ProductImageModel.fromJson(e as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return ProductModel(
      id: json['id'] as int,
      categoryId: json['category_id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String?,
      basePrice: (json['base_price'] as num).toDouble(),
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'name': name,
      'description': description,
      'base_price': basePrice,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
