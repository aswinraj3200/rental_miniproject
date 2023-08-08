import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/rent_screen.dart';
import 'package:rentalapp/model/product_model.dart';
import 'package:rentalapp/resources/cloudfirestore_methods.dart';

import 'package:rentalapp/utils/colour_theme.dart';
import 'package:rentalapp/utils/utils.dart';
import 'package:rentalapp/widgets/appbar_widget.dart';
import 'package:rentalapp/widgets/custombutton_widget.dart';
import 'package:rentalapp/widgets/price_widget.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('RENT APP'),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height / 7,
                    width: screenSize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            widget.productModel.productname,
                            maxLines: 2,
                            style: const TextStyle(
                              color: activeCyanColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              letterSpacing: 0.9,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.productModel.catagory,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 3,
                    child: Image.network(widget.productModel.imgurl),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: PriceWidget(
                          color: Colors.black,
                          price: widget.productModel.price),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CustomMainButtonWidget(
                      color: const Color.fromARGB(255, 229, 94, 85),
                      isLoading: false,
                      onPressed: () {
                        //rent screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const RentScreen())));
                      },
                      child: const Text('Rent'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: CustomMainButtonWidget(
                      color: const Color.fromARGB(255, 250, 117, 108),
                      isLoading: false,
                      onPressed: () async {
                        //add to wishlist
                        await CloudFirestoreClass().addProductToWishlist(
                            productModel: widget.productModel);
                        Utils().showSnackBar(
                            context: context, content: "Added To Wistlist");
                      },
                      child: const Text('Wishlist'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Address",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: screenSize.width,
                          child: Text(
                            widget.productModel.address,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Description",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: screenSize.width,
                          child: Text(
                            widget.productModel.description,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Contact Details",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: screenSize.width,
                          child: Text(
                            widget.productModel.phno,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
