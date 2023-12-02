import 'AssociatedObject.dart';

class EphemeralKeyModel {
  final String id;
  final String object;
  final List<AssociatedObject> associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  EphemeralKeyModel({
    required this.id,
    required this.object,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'],
      object: json['object'],
      associatedObjects: (json['associated_objects'] as List<dynamic>?)
          ?.map((item) => AssociatedObject.fromJson(item))
          .toList() ??
          [],
      created: json['created'],
      expires: json['expires'],
      livemode: json['livemode'],
      secret: json['secret'],
    );
  }
}
