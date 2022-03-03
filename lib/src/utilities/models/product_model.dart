import 'dart:convert';

class ProductModel {
  int? id;
  String? title;
  double? price;
  ProductModel({
    this.id,
    this.title,
    this.price,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt(),
      title: map['title'],
      price: map['price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProductModel(id: $id, title: $title, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.id == id && other.title == title && other.price == price;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ price.hashCode;
}
