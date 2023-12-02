import 'package:flutter/material.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/payment_methods_list.dart';

import 'custom_bloc_consumer_button.dart';

class PaymentsMethodsBottomSheet extends StatefulWidget {
   const PaymentsMethodsBottomSheet({super.key});


  @override
  State<PaymentsMethodsBottomSheet> createState() => _PaymentsMethodsBottomSheetState();
}

class _PaymentsMethodsBottomSheetState extends State<PaymentsMethodsBottomSheet> {
  bool isPayPal=false;
  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPayPal = false;
    } else {
      isPayPal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16,),
          PaymentMethodsList(updatePaymentMethod: updatePaymentMethod),
          const SizedBox(height: 20),
           CustomBlocConsumerButton(isPayPal: isPayPal),
        ],
      ),
    );
  }
}
