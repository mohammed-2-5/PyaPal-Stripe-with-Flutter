import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/check%20out/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/TotalPrice.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/order_info_item.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/payments_methods_bottom_sheet.dart';

import '../../../../Core/utils/custom_button.dart';
import '../../data/repo/check_out_repo_impl.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/Cart.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(item1: 'Order Subtotal', item2: '\$42.97'),
          const SizedBox(height: 3),
          const OrderInfoItem(item1: 'Discount', item2: '\$0'),
          const SizedBox(height: 3),
          const OrderInfoItem(item1: 'Shipping', item2: '\$8'),
          const Divider(
            height: 34,
            thickness: 2,
            color: Colors.black,
          ),
          const TotalPriceItem(item1: 'Total', item2: '\$50.97'),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            processName: 'Complete Payment',
            onTab: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                builder: (context) => BlocProvider(
                    create: (context) => PaymentCubit(CheckOutRepoImpl()),
                    child: const PaymentsMethodsBottomSheet()),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
