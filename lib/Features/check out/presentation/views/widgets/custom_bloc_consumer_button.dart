import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Core/constants.dart';
import 'package:payment/Features/check%20out/data/models/AmountModel.dart';
import 'package:payment/Features/check%20out/data/models/ItemListModel.dart';
import 'package:payment/Features/check%20out/presentation/views/thank_view.dart';

import '../../../../../Core/utils/custom_button.dart';
import '../../../data/models/PaymentIntentInputModel.dart';
import '../../manger/cubit/payment_cubit.dart';
import '../my_cart.dart';

class CustomBlocConsumerButton extends StatelessWidget {
  const CustomBlocConsumerButton({
    super.key, required this.isPayPal,
  });
  final bool isPayPal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankView(),
          ));
        }
        if (state is PaymentFailure) {
          Navigator.pop(context);
          if (kDebugMode) {
            print(state.errorMessage);
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
      },
      builder: (context, state) {
        return CustomButton(
            isLoading: state is PaymentLoading ? true : false,
            onTab: () {
              if (isPayPal) {
                var transaction=getTransaction();
                paypalPaymentProcess(context, transaction);
              }else{
                stripePaymentProcess(context);
              }



            },
            processName: 'Continue');
      },
    );
  }

  void paypalPaymentProcess(BuildContext context, ({AmountDetailsModel amount, ItemsModel itemList}) transaction) {
     Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: paypalClientId,
        secretKey: paypalSecretKey,
        transactions: [
          {
            "amount": transaction.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transaction.itemList.toJson(),

          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const ThankView();
            }),
                (route) {
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            },
          );
        },
        onError: (error) {
          log("onError: $error");
          SnackBar snackBar = SnackBar(content: Text(error.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const MyCart();
            }),
                (route) {
              return false;
            },
          );
        },
        onCancel: () {
          if (kDebugMode) {
            print('cancelled:');
          }
          Navigator.pop(context);
        },
      ),
    ));
  }

  void stripePaymentProcess(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel =
        PaymentIntentInputModel(
      100,
      'USD',
      "cus_P6IpJjys7hTrNp",
    );
    BlocProvider.of<PaymentCubit>(context).makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
  }
  ({AmountDetailsModel amount, ItemsModel itemList})getTransaction(){
    var amount = AmountDetailsModel(
        total: "100",
        currency: 'USD',
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'));
    List<ProductModel> orders= [
      ProductModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,),
      ProductModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,),
    ];
    var itemList = ItemsModel(items:orders);
    return(amount:amount,itemList:itemList);
  }
}
