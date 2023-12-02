import 'package:flutter/material.dart';

import 'package:payment/Features/check%20out/presentation/views/my_cart_body.dart';

import '../../../../Core/utils/CustomAppBar.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'My Cart',imgUrl: 'assets/images/Arrow.svg'),
      body: const MyCartBody(),
    );
  }

}
