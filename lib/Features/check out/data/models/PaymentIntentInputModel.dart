class PaymentIntentInputModel{
  final num amount;
  final String currency;
  final String customerId;
  PaymentIntentInputModel(this.amount, this.currency, this.customerId);


  Map<String, dynamic> toJson() {
    return {
      'amount': amount*100,
      'currency': currency,
      "customer":customerId,
    };
  }
}