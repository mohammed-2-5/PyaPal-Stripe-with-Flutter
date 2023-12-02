
/// Card-specific options.
class CardOptions {
  final String? requestThreeDSecure; // Nullable field

  CardOptions({this.requestThreeDSecure});

  factory CardOptions.fromJson(Map<String, dynamic> json) => CardOptions(
    requestThreeDSecure: json['request_three_d_secure'],
  );

  Map<String, dynamic> toJson() => {
    'request_three_d_secure': requestThreeDSecure,
  };
}