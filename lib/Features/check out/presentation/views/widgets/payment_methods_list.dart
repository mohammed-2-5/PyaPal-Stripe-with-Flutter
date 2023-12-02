import 'package:flutter/material.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodsList extends StatefulWidget {
  const PaymentMethodsList({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodsList> createState() => _PaymentMethodsListState();
}

class _PaymentMethodsListState extends State<PaymentMethodsList> {
  final List<String> imagesList=['assets/images/card.svg','assets/images/PayPal.svg'];
  int indexItem=0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 10,),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:() {
               indexItem=index;
               setState(() {

               });
               widget.updatePaymentMethod(index: indexItem);
              },
              child: PaymentMethodItem(
                isActive:indexItem==index,
                  imgUrl: imagesList[index]
              ),
            );
          },
          itemCount: imagesList.length,
          scrollDirection: Axis.horizontal
      ),
    );
  }
}

