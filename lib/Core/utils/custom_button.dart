import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.onTab, required this.processName,  this.isLoading=false,
  });
  final void Function()? onTab;
  final  String processName;
  final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child:Container(
        width: 350,
        height: 73,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child:isLoading?const CircularProgressIndicator() : Text(
            processName,
            textAlign: TextAlign.center,
            style: const TextStyle(

              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ) ,
    );
  }
}
