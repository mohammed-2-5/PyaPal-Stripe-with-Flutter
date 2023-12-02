class AssociatedObject {
  final String id;
  final String type;

  AssociatedObject({
    required this.id,
    required this.type,
  });

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(
      id: json['id'],
      type: json['type'],
    );
  }
}