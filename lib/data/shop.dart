class Shop {
  final String name;
  final String location;
  final String email;
  final String telephone;
  final String longitude;
  final String latitude;
  final String ownerName;
  final String address;
  final String? id;

  // ignore: sort_constructors_first
  Shop(
      {required this.name,
      required this.location,
      required this.email,
      required this.telephone,
      required this.longitude,
      required this.latitude,
      required this.ownerName,
      required this.id,
      required this.address});

  // ignore: sort_constructors_first
  factory Shop.fromJSON(Map<String, dynamic> data) {
    return Shop(
        id: data['_id'],
        name: data['name'],
        location: data['location'],
        email: data['email'],
        telephone: data['telephone'],
        longitude: data['longitude'],
        latitude: data['latitude'],
        ownerName: data['ownerName'],
        address: data['address']);
  }
}
