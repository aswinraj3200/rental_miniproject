import 'package:flutter/material.dart';
import 'package:rentalapp/widgets/price_widget.dart';

import '../Screens/product_screen.dart';
import '../model/product_model.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productModel: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(
                product.imgurl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                product.productname,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: SizedBox(
                height: 20,
                child: FittedBox(
                  child: PriceWidget(
                    color: const Color.fromARGB(255, 92, 9, 3),
                    price: product.price,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
