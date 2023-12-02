class Details {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  Details({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}

class AmountDetailsModel {
  final String total;
  final String currency;
  final Details details;

  AmountDetailsModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details.toJson(),
    };
  }
}
