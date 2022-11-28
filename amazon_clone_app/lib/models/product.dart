import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final dynamic quantity;
  final String category;
  final dynamic price;
  final String? id;

  final List<dynamic> images;
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.category,
    required this.price,
    this.id,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'category': category,
      'price': price,
      'id': id,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as dynamic,
      category: map['category'] as String,
      price: map['price'] as dynamic,
      id: map['_id'] != null ? map['id'] as String : null,
      images: List<dynamic>.from((map['images'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
