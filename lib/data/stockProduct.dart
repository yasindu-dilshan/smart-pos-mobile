class StockProduct {
  StockProduct(
      {required this.id,
      required this.name,
      required this.unitPrice,
      required this.quantity});
  final String id;
  final String name;
  final int unitPrice;
  final int quantity;

  // ignore: sort_constructors_first
  factory StockProduct.fromJSON(Map<String, dynamic> data) {
    return StockProduct(
      id: data['product']['_id'],
      name: data['product']['name'],
      unitPrice: data['product']['unitPrice'],
      quantity: data['quantity'],
    );
  }
}
