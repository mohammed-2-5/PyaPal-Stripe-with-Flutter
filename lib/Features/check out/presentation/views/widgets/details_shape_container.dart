import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/Core/utils/Styles.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/TotalPrice.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/order_info_item.dart';

class DetailsShapeContainer extends StatelessWidget {
  const DetailsShapeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color:const  Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top:56,),
        child: Column(children: [
          Text(
            'Thank you!',
            textAlign: TextAlign.center,
            style: Styles.style25,
          ),
          const SizedBox(height: 5,),
           Text(
            'Your transaction was successful',
            textAlign: TextAlign.center,
            style: Styles.style20,
          ),
          const SizedBox(height:42),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const OrderInfoItem(item1: 'Date', item2: '01/24/2023'),
                 const SizedBox(height:20),
                const OrderInfoItem(item1: 'Time', item2: '10:15 AM'),
                const SizedBox(height:20),
                const OrderInfoItem(item1: 'To', item2: 'Sam Louis'),
                const SizedBox(height:20),
                const Divider(
                  thickness: 1.5,
                  color:  Color(0xFFC6C6C6),
                ),
                const SizedBox(height:24),
                const TotalPriceItem(item1: 'Total', item2: '\$50.97'),
                const SizedBox(height:20),
                Container(
                  width: 305,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child:  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 23,vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/masrecard.svg'),
                        const SizedBox(width:22),
                        Text.rich(
                          TextSpan(

                            children: [

                              const TextSpan(
                                text: 'Credit Card ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Mastercard **78 ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.699999988079071),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          const Spacer(),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Icon(FontAwesomeIcons.barcode,size: 65,),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child:  Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(color: const  Color(0xFF34A853),),
                    ),
                  ),
                )
            ],
            ),
          ),
          SizedBox(height:  (MediaQuery.of(context).size.height*0.24/2)-29,)
        ]),
      ),
    );
  }
}
