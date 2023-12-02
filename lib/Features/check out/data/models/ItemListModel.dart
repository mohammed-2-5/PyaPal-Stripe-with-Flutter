class ProductModel {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  ProductModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}

class ItemsModel {
  final List<ProductModel> items;

  ItemsModel({required this.items});

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}