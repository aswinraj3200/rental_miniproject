import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentalapp/utils/colour_theme.dart';

import '../model/product_model.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/result_widget.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('RENT APP'),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Showing results for ",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: query,
                        style: const TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            color: activeCyanColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Expanded(
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("products")
                        .where("catagory", isEqualTo: query)
                        .get(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget();
                      } else {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 2 / 2),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              ProductModel product =
                                  ProductModel.getModelFromJson(
                                      json: snapshot.data!.docs[index].data());
                              return ResultsWidget(product: product);
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
