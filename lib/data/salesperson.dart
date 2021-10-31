class Salesperson {
  Salesperson({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.warehouseId,
  });

  factory Salesperson.fromJSON(Map<String, dynamic> data) {
    return Salesperson(
        id: data['_id'],
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        warehouseId: data['warehouseId']);
  }

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String warehouseId;
}
