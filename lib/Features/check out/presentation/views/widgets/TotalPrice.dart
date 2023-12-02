import 'package:flutter/material.dart';

import '../../../../../Core/utils/Styles.dart';

class TotalPriceItem extends StatelessWidget {
  const TotalPriceItem({
    super.key, required this.item1, required this.item2,
  });
  final String item1;
  final String item2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          item1,
          textAlign: TextAlign.center,
          style: Styles.style25
          ,
        ),
        const Spacer(),
        Text(
          item2,
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ],
    );
  }
}
