import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 2,
      dashLength: 5.0,
      dashColor: Color(0xFFB7B7B7),

      dashRadius: 0.0,
      dashGapLength: 4.0,
      dashGapColor: Colors.transparent,

      dashGapRadius: 0.0,
    );
  }
}
