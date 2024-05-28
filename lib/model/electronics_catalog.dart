class CatalogModel {
  static List<MyElectronicsCatalog> products = [
    MyElectronicsCatalog(
        id: "Codepur001",
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        productUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];
}

class MyElectronicsCatalog {
  final String id;
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
  toMap() => {
        "id": id,
        'name': name,
        'desc': desc,
        'price': price,
        'color': color,
        'productUrl': productUrl,
      };
}
