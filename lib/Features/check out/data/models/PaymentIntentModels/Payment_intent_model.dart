import 'AmountDetailsModel.dart';
import 'PaymentMethodsOptions.dart';

class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final String? description; // Nullable field
  final bool livemode;
  final Map<String, dynamic> metadata;
  final List<String> paymentMethodTypes;
  final PaymentMethodOptions paymentMethodOptions;
  final String status;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    this.description, // Nullable field
    required this.livemode,
    required this.metadata,
    required this.paymentMethodTypes,
    required this.paymentMethodOptions,
    required this.status,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) => PaymentIntentModel(
    id: json['id'],
    object: json['object'],
    amount: json['amount'],
    amountCapturable: json['amount_capturable'],
    amountDetails: AmountDetails.fromJson(json['amount_details'] ?? {}),
    amountReceived: json['amount_received'],
    captureMethod: json['capture_method'],
    clientSecret: json['client_secret'],
    confirmationMethod: json['confirmation_method'],
    created: json['created'],
    currency: json['currency'],
    description: json['description'],
    livemode: json['livemode'],
    metadata: json['metadata'] ?? {},
    paymentMethodTypes: List<String>.from(json['payment_method_types']),
    paymentMethodOptions: PaymentMethodOptions.fromJson(json['payment_method_options']),
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'object': object,
    'amount': amount,
    'amount_capturable': amountCapturable,
    'amount_details': amountDetails.toJson(),
    'amount_received': amountReceived,
    'capture_method': captureMethod,
    'client_secret': clientSecret,
    'confirmation_method': confirmationMethod,
    'created': created,
    'currency': currency,
    'description': description,
    'livemode': livemode,
    'metadata': metadata,
    'payment_method_types': paymentMethodTypes,
    'payment_method_options': paymentMethodOptions.toJson(),
    'status': status,
  };
}

/// card : {"installments":null,"mandate_options":null,"network":null,"request_three_d_secure":"automatic"}

