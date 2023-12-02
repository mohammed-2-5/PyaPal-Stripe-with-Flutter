import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Core/constants.dart';

import 'Core/utils/bloc_observer.dart';
import 'Features/check out/Presentation/views/my_cart.dart';

void main() {
  Stripe.publishableKey=publishKey;
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyCart(),
    );
  }
}

