// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

class CatalogModel {
  static List<MyElectronicsCatalog> items = [];
}

class MyElectronicsCatalog {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String productUrl;

  MyElectronicsCatalog(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.productUrl});

  MyElectronicsCatalog copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? productUrl,
  }) {
    return MyElectronicsCatalog(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      productUrl: productUrl ?? this.productUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'productUrl': productUrl,
    };
  }

  factory MyElectronicsCatalog.fromMap(Map<String, dynamic> map) {
    return MyElectronicsCatalog(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'],
      color: map['color'],
      productUrl: map['productUrl'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory MyElectronicsCatalog.fromJson(String source) =>
  //     MyElectronicsCatalog.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'MyElectronicsCatalog(id: $id, name: $name, desc: $desc, price: $price, color: $color, productUrl: $productUrl)';
  // }

  // @override
  // bool operator ==(covariant MyElectronicsCatalog other) {
  //   if (identical(this, other)) return true;

  //   return other.id == id &&
  //       other.name == name &&
  //       other.desc == desc &&
  //       other.price == price &&
  //       other.color == color &&
  //       other.productUrl == productUrl;
  // }

  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       name.hashCode ^
  //       desc.hashCode ^
  //       price.hashCode ^
  //       color.hashCode ^
  //       productUrl.hashCode;
  // }
}
