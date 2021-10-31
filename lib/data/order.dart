class Order {
  Order({
    required this.id,
    required this.date,
    required this.totalPrice,
    required this.receivedPrice,
  });

  factory Order.fromJSON(Map<String, dynamic> data) {
    return Order(
      id: data['_id'],
      date: data['createdAt'],
      totalPrice: data['totalPrice'],
      receivedPrice: data['receivedPrice'],
    );
  }

  final String id;
  final String date;
  final int totalPrice;
  int receivedPrice;
}
