class CartProduct {
  CartProduct(
      {required this.id,
      required this.name,
      required this.uniPrice,
      required this.selectedQuantity,
      required this.stockQuantity});

  final String id;
  final String name;
  final int uniPrice;
  final int stockQuantity;
  int selectedQuantity;
}
