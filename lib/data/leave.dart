class Leave {
  final String id;
  final String description;
  final String from;
  final String to;
  final bool approved;

  // ignore: sort_constructors_first
  Leave(
      {required this.id,
      required this.description,
      required this.from,
      required this.to,
      required this.approved});

  // ignore: sort_constructors_first
  factory Leave.fromJSON(Map<String, dynamic> data) {
    return Leave(
        id: data['_id'],
        description: data['description'],
        from: data['from'],
        to: data['to'],
        approved: data['approved']);
  }
}
