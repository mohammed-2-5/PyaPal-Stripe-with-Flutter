import 'package:flutter/material.dart';
import 'package:payment/Core/utils/CustomAppBar.dart';
import 'package:payment/Features/check%20out/presentation/views/thank_view_body.dart';

class ThankView extends StatelessWidget {
  const ThankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(imgUrl: 'assets/images/Arrow.svg'),
      body: Transform.translate(offset: const Offset(0, -20),
      child: const ThankViewBody()),
    );
  }
}
