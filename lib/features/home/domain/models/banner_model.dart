class BannerModel {
  final int id;
  final String image;
  final Product? product;
  final String? category;
  final String? name;
  final int? showingOrder;
  final bool? isActive;

  BannerModel({
    required this.id,
    required this.image,
    this.product,
    this.category,
    this.name,
    this.showingOrder,
    this.isActive,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
      name: json['name'],
      showingOrder: json['showing_order'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'product': product?.toJson(),
      'category': category,
      'name': name,
      'showing_order': showingOrder,
      'is_active': isActive,
    };
  }
}

class Product {
  final int id;
  final List<dynamic>? variations;
  final bool? inWishlist;
  final double? avgRating;
  final List<String>? images;
  final bool? variationExists;
  final double? salePrice;
  final List<Addon>? addons;
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
  final int? showingOrder;
  final String? variationName;
  final int? category;
  final int? taxRate;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      variations: json['variations'],
      inWishlist: json['in_wishlist'],
      avgRating: json['avg_rating']?.toDouble(),
      images: json['images'] != null ? List<String>.from(json['images']) : null,
      variationExists: json['variation_exists'],
      salePrice: json['sale_price']?.toDouble(),
      addons: json['addons'] != null
          ? List<Addon>.from(json['addons'].map((x) => Addon.fromJson(x)))
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'variations': variations,
      'in_wishlist': inWishlist,
      'avg_rating': avgRating,
      'images': images,
      'variation_exists': variationExists,
      'sale_price': salePrice,
      'addons': addons?.map((x) => x.toJson()).toList(),
      'available': available,
      'available_from': availableFrom,
      'available_to': availableTo,
      'name': name,
      'description': description,
      'caption': caption,
      'featured_image': featuredImage,
      'mrp': mrp,
      'stock': stock,
      'is_active': isActive,
      'discount': discount,
      'created_date': createdDate,
      'product_type': productType,
      'showing_order': showingOrder,
      'variation_name': variationName,
      'category': category,
      'tax_rate': taxRate,
    };
  }
}

class Addon {
  final int id;
  final double? price;
  final String? name;
  final String? description;
  final String? featuredImage;
  final int? stock;
  final bool? isActive;
  final int? taxRate;

  Addon({
    required this.id,
    this.price,
    this.name,
    this.description,
    this.featuredImage,
    this.stock,
    this.isActive,
    this.taxRate,
  });

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      id: json['id'],
      price: json['price']?.toDouble(),
      name: json['name'],
      description: json['description'],
      featuredImage: json['featured_image'],
      stock: json['stock'],
      isActive: json['is_active'],
      taxRate: json['tax_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'name': name,
      'description': description,
      'featured_image': featuredImage,
      'stock': stock,
      'is_active': isActive,
      'tax_rate': taxRate,
    };
  }
}
