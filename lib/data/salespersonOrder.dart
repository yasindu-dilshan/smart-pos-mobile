class SalespersonOrder {
  SalespersonOrder(
      {required this.id,
      required this.date,
      required this.totalPrice,
      required this.receivedPrice,
      required this.shopName,
      required this.shopTelephone});
  final String id;
  final String date;
  final int totalPrice;
  int receivedPrice;
  final String shopName;
  final String shopTelephone;

  // ignore: sort_constructors_first
  factory SalespersonOrder.fromJSON(Map<String, dynamic> data) {
    return SalespersonOrder(
        id: data['_id'],
        date: data['createdAt'],
        totalPrice: data['totalPrice'],
        receivedPrice: data['receivedPrice'],
        shopName: data['shop']['name'],
        shopTelephone: data['shop']['telephone']);
  }
}
