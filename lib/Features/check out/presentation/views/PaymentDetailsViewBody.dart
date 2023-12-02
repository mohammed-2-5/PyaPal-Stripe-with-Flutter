
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/Core/utils/custom_button.dart';
import 'package:payment/Features/check%20out/presentation/views/thank_view.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/payment_methods_list.dart';

class PaymentDetailsViewBody extends StatefulWidget {
   const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(12 ),
      child: CustomScrollView(
        slivers: [
          // const SliverToBoxAdapter(
          //   child: PaymentMethodsList(),
          // ),
          const SliverToBoxAdapter(child: SizedBox(height: 20,)),
           SliverToBoxAdapter(child: CustomCreditCard(
             autoValidateMode: autoValidateMode,formKey: formKey,)),
          SliverFillRemaining(
            hasScrollBody: false,
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: CustomButton(
                processName: 'Pay',
                onTab: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('PaymentDone');
                  }else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const  ThankView(),));
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {
                    });
                  }

              },),
            ),
          ))
        ],
      ),
    );
  }
}

