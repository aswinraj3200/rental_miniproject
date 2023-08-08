import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:rentalapp/model/product_model.dart';
import 'package:rentalapp/widgets/wishlist_widget.dart';

class YourWishlistWidget extends StatefulWidget {
  const YourWishlistWidget({Key? key}) : super(key: key);

  @override
  State<YourWishlistWidget> createState() => _YourWishlistWidget();
}

class _YourWishlistWidget extends State<YourWishlistWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("wishlist")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (contex, index) {
                  ProductModel model = ProductModel.getModelFromJson(
                      json: snapshot.data!.docs[index].data());
                  return WishlistWidget(productModel: model);
                });
          }
        },
      ),
    );
  }
}
