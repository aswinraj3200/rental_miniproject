import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentalapp/widgets/yourrenting_widget.dart';

import '../model/product_model.dart';
import '../model/userdetails_model.dart';
import '../provider/userdetail_provider.dart';

class YourRentingScreen extends StatefulWidget {
  const YourRentingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<YourRentingScreen> createState() => _YourRentingScreen();
}

class _YourRentingScreen extends State<YourRentingScreen> {
  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    String name = userDetails.name;
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("products")
            .where("rentedby", isEqualTo: name)
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
                  return YourRentingWidget(productModel: model);
                });
          }
        },
      ),
    );
  }
}
