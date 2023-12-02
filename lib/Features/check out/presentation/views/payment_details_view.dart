import 'package:flutter/material.dart';
import 'package:payment/Features/check%20out/presentation/views/PaymentDetailsViewBody.dart';

import '../../../../Core/utils/CustomAppBar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'PaymentDetails',imgUrl: 'assets/images/Arrow.svg'),
      body: const PaymentDetailsViewBody(),
    );
  }
}
