import 'dart:ui';

import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final Color color;
  final String price;
  const PriceWidget({
    Key? key,
    required this.color,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "₹",
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontFeatures: const [
              FontFeature.superscripts(),
            ],
          ),
        ),
        Text(
          price.toString(),
          style: TextStyle(
            fontSize: 25,
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          (int.parse(price) - (int.parse(price).truncate())).toString(),
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontFeatures: const [
              FontFeature.superscripts(),
            ],
          ),
        )
      ],
    );
  }
}
