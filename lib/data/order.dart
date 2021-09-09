class Order {
  Order(
      {required this.id,
      required this.shop_id,
      required this.date,
      required this.total});
  final String id;
  final String shop_id;
  final String date;
  final String total;

  factory Order.fromJSON(Map<String, dynamic> data) {
    return Order(
        id: data['id'],
        shop_id: data['shop_id'],
        date: data['date'],
        total: data['total']);
  }
}
