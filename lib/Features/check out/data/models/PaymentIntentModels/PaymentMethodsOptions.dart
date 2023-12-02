import 'CardOptionsModel.dart';

class PaymentMethodOptions {
  final CardOptions card;

  PaymentMethodOptions({required this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
    card: CardOptions.fromJson(json['card'] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    'card': card.toJson(),
  };
}