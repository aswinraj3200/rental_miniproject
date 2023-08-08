import 'package:flutter/material.dart';
import 'package:rentalapp/utils/colour_theme.dart';


import 'price_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  final String productname;
  final String price;
  final String rentedby;
  final String catogory;
  final String description;
  const ProductInfoWidget({
    Key? key,
    required this.productname,
    required this.catogory,
    required this.rentedby,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width / 2,
      height: screenSize.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                productname,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.9,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  catogory,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: PriceWidget(color: Colors.black, price: price),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Sold by  ",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 14),
                          ),
                          TextSpan(
                            text: rentedby,
                            style: const TextStyle(
                                color: activeCyanColor, fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            //r ProductDescriptionWidget(description: description),
          ],
        ),
      ),
    );
  }
}
