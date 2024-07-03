import 'package:flutter_application_2/model/electronics_catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // CATALOG FIELD
  late CatalogModel _catalog;

  // COLLECTION OF ID'S - stores id of each item
  final List<int> _itemIds = [];

  // Set Catalog
  set catalog(CatalogModel newcatalog) {
    _catalog = newcatalog;
  }

  // GET CATALOG
  CatalogModel get catalog => _catalog;

  // Get Items in the cart
  List<MyElectronicsCatalog> get items =>
      _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get Total Price
  num get totalPrice => items.fold(
        0,
        (total, current) => total + current.price,
      );

  // Add Item
  void addItem(MyElectronicsCatalog item) {
    _itemIds.add(item.id);
  }

  // Remove Item
  void removeItem(MyElectronicsCatalog item) {
    _itemIds.remove(item.id);
  }
}
