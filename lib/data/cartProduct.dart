class CartProduct {
  CartProduct({
    required this.id,
    required this.name,
    required this.uniPrice,
    required this.selectedQuantity,
    required this.stockQuantity,
    required this.photo,
    required this.sales,
  });

  final String id;
  final String name;
  final int uniPrice;
  final int stockQuantity;
  int selectedQuantity;
  final String photo;
  final int sales;
}
