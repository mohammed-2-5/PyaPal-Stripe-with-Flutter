
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Styles.dart';

AppBar customAppBar({
   String? title,required String? imgUrl}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Center(
        child: GestureDetector(
            child: SvgPicture.asset(
              imgUrl!,
              width: 30,
              height: 30,
            ))),
    centerTitle: true,
    title: Text(
      title??'',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
