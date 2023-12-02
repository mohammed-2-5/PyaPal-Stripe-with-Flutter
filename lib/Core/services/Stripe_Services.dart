
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Core/constants.dart';
import 'package:payment/Core/services/api_services.dart';
import 'package:payment/Features/check%20out/data/models/EphemeralKeyModels/EphemeralKeyModel.dart';
import 'package:payment/Features/check%20out/data/models/InitPaymentSheetInputModel.dart';
import 'package:payment/Features/check%20out/data/models/PaymentIntentInputModel.dart';

import '../../Features/check out/data/models/PaymentIntentModels/Payment_intent_model.dart';

class StripeServices {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        contentType: 'application/x-www-form-urlencoded',
        body: paymentIntentInputModel.toJson(),
        url: apiUrl,
        token: secretKey);
    var data = PaymentIntentModel.fromJson(response.data);
    return data;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel paymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Eng:Mohammed Yasser',
            paymentIntentClientSecret: paymentSheetInputModel.clientSecretKey,
            customerEphemeralKeySecret: paymentSheetInputModel.ephemeralKey,
            customerId: paymentSheetInputModel.customerId));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({required String customerId}) async {
    var response = await apiService.post(
        contentType:Headers.formUrlEncodedContentType,
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: secretKey,
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Stripe-Version': '2022-11-15'
        });
    var data = EphemeralKeyModel.fromJson(response.data);
    return data;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {

    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    var paymentSheetModel=InitPaymentSheetInputModel(
        clientSecretKey: paymentIntentModel.clientSecret,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKey: ephemeralKeyModel.secret);
    await initPaymentSheet(paymentSheetInputModel: paymentSheetModel
        );
    await displayPaymentSheet();
  }
}
