class ProductModel {
  final int id;
  final List<dynamic>? variations;
  final bool? inWishlist;
  final double? avgRating;
  final List<String>? images;
  final bool? variationExists;
  final double? salePrice;
  final List<AddonModel>? addons;
  final bool? available;
  final String? availableFrom;
  final String? availableTo;
  final String? name;
  final String? description;
  final String? caption;
  final String? featuredImage;
  final double? mrp;
  final int? stock;
  final bool? isActive;
  final String? discount;
  final String? createdDate;
  final String? productType;
  final dynamic showingOrder;
  final String? variationName;
  final int? category;
  final int? taxRate;

  ProductModel({
    required this.id,
    this.variations,
    this.inWishlist,
    this.avgRating,
    this.images,
    this.variationExists,
    this.salePrice,
    this.addons,
    this.available,
    this.availableFrom,
    this.availableTo,
    this.name,
    this.description,
    this.caption,
    this.featuredImage,
    this.mrp,
    this.stock,
    this.isActive,
    this.discount,
    this.createdDate,
    this.productType,
    this.showingOrder,
    this.variationName,
    this.category,
    this.taxRate,
  });

  ProductModel copyWith({
    int? id,
    List<dynamic>? variations,
    bool? inWishlist,
    double? avgRating,
    List<String>? images,
    bool? variationExists,
    double? salePrice,
    List<AddonModel>? addons,
    bool? available,
    String? availableFrom,
    String? availableTo,
    String? name,
    String? description,
    String? caption,
    String? featuredImage,
    double? mrp,
    int? stock,
    bool? isActive,
    String? discount,
    String? createdDate,
    String? productType,
    dynamic showingOrder,
    String? variationName,
    int? category,
    int? taxRate,
  }) {
    return ProductModel(
      id: id ?? this.id,
      variations: variations ?? this.variations,
      inWishlist: inWishlist ?? this.inWishlist,
      avgRating: avgRating ?? this.avgRating,
      images: images ?? this.images,
      variationExists: variationExists ?? this.variationExists,
      salePrice: salePrice ?? this.salePrice,
      addons: addons ?? this.addons,
      available: available ?? this.available,
      availableFrom: availableFrom ?? this.availableFrom,
      availableTo: availableTo ?? this.availableTo,
      name: name ?? this.name,
      description: description ?? this.description,
      caption: caption ?? this.caption,
      featuredImage: featuredImage ?? this.featuredImage,
      mrp: mrp ?? this.mrp,
      stock: stock ?? this.stock,
      isActive: isActive ?? this.isActive,
      discount: discount ?? this.discount,
      createdDate: createdDate ?? this.createdDate,
      productType: productType ?? this.productType,
      showingOrder: showingOrder ?? this.showingOrder,
      variationName: variationName ?? this.variationName,
      category: category ?? this.category,
      taxRate: taxRate ?? this.taxRate,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      variations: json['variations'] as List<dynamic>?,
      inWishlist: json['in_wishlist'],
      avgRating: json['avg_rating']?.toDouble(),
      images: List<String>.from(json['images'] ?? []),
      variationExists: json['variation_exists'],
      salePrice: json['sale_price']?.toDouble(),
      addons: json['addons'] != null
          ? List<AddonModel>.from(
              json['addons'].map((x) => AddonModel.fromJson(x)))
          : null,
      available: json['available'],
      availableFrom: json['available_from'],
      availableTo: json['available_to'],
      name: json['name'],
      description: json['description'],
      caption: json['caption'],
      featuredImage: json['featured_image'],
      mrp: json['mrp']?.toDouble(),
      stock: json['stock'],
      isActive: json['is_active'],
      discount: json['discount'],
      createdDate: json['created_date'],
      productType: json['product_type'],
      showingOrder: json['showing_order'],
      variationName: json['variation_name'],
      category: json['category'],
      taxRate: json['tax_rate'],
    );
  }
}

class AddonModel {
  final int id;
  final double price;
  final String name;
  final String description;
  final String featuredImage;
  final int stock;
  final bool isActive;
  final int taxRate;

  AddonModel({
    required this.id,
    required this.price,
    required this.name,
    required this.description,
    required this.featuredImage,
    required this.stock,
    required this.isActive,
    required this.taxRate,
  });

  AddonModel copyWith({
    int? id,
    double? price,
    String? name,
    String? description,
    String? featuredImage,
    int? stock,
    bool? isActive,
    int? taxRate,
  }) {
    return AddonModel(
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      description: description ?? this.description,
      featuredImage: featuredImage ?? this.featuredImage,
      stock: stock ?? this.stock,
      isActive: isActive ?? this.isActive,
      taxRate: taxRate ?? this.taxRate,
    );
  }

  factory AddonModel.fromJson(Map<String, dynamic> json) {
    return AddonModel(
      id: json['id'],
      price: json['price']?.toDouble() ?? 0.0,
      name: json['name'],
      description: json['description'],
      featuredImage: json['featured_image'],
      stock: json['stock'] ?? 0,
      isActive: json['is_active'] ?? false,
      taxRate: json['tax_rate'] ?? 0,
    );
  }
}
