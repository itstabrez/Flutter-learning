import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/model/electronics_catalog.dart';

class CartProvider with ChangeNotifier {
  final List<MyElectronicsCatalog> _items = [];

  List<MyElectronicsCatalog> get items => _items;

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.price);

  void addItem(MyElectronicsCatalog catalog) {
    _items.add(catalog);
    notifyListeners();
  }

  void removeItem(MyElectronicsCatalog catalog) {
    _items.remove(catalog);
    notifyListeners();
  }

  bool isInCart(MyElectronicsCatalog catalog) {
    return _items.contains(catalog);
  }
}
