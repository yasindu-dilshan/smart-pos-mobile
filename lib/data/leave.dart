class Leave {
  Leave(
      {required this.id,
      required this.description,
      required this.from,
      required this.to,
      required this.approved});

  factory Leave.fromJSON(Map<String, dynamic> data) {
    return Leave(
        id: data['_id'],
        description: data['description'],
        from: data['from'],
        to: data['to'],
        approved: data['approved']);
  }
  final String id;
  final String description;
  final String from;
  final String to;
  final String approved;
}
