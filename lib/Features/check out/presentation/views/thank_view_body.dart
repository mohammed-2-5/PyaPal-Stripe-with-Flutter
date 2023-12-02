import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/dashed_line.dart';
import 'package:payment/Features/check%20out/presentation/views/widgets/details_shape_container.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const DetailsShapeContainer(),
           Positioned(
             left: -20,
            bottom: MediaQuery.of(context).size.height*0.18,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )
          ),
          Positioned(left: 0,right: 0,
              bottom: MediaQuery.of(context).size.height*0.20,
              child:  const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: DashedLine(),
              )

          ),
          Positioned(
              right: -20,
              bottom:MediaQuery.of(context).size.height*0.18 ,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )
          ),
            Positioned(
             top: -50,
             left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 50,
            backgroundColor: const Color(0xFFEDEDED),

            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFF34A853),
              child: SvgPicture.asset('assets/images/Vector.svg'),
            ),
          ))
        ],
      ),
    );
  }
}


