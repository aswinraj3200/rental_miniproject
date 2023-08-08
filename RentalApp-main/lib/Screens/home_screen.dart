import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:rentalapp/widgets/adshowcaselistview_widget.dart';

import 'package:rentalapp/widgets/appbar_widget.dart';
import 'package:rentalapp/widgets/horizontallistview_widget.dart';
import 'package:rentalapp/widgets/loading_widget.dart';
import 'package:rentalapp/widgets/locationbar_widget.dart';

import '../resources/cloudfirestore_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>? catagoryApartment;
  List<Widget>? catagoryHouse;
  List<Widget>? catagoryHostel;
  List<Widget>? catagoryPayingGuest;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    List<Widget> tempApartment =
        await CloudFirestoreClass().getProductsFromCatagory("Apartment");
    List<Widget> tempHouse =
        await CloudFirestoreClass().getProductsFromCatagory("House");
    List<Widget> tempHostels =
        await CloudFirestoreClass().getProductsFromCatagory("Hostel");
    List<Widget> tempPayingGuests =
        await CloudFirestoreClass().getProductsFromCatagory("Paying Guest");
    log("success");
    setState(() {
      catagoryApartment = tempApartment;
      catagoryHouse = tempHouse;
      catagoryHostel = tempHostels;
      catagoryPayingGuest = tempPayingGuests;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('RENT APP'),
        ),
        body: catagoryApartment != null &&
                catagoryHouse != null &&
                catagoryHostel != null &&
                catagoryPayingGuest != null
            ? Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const LocationBar(),
                        const HorizontalListViewBar(),
                        AdsListViewShowcaseWidget(
                            title: 'Apartment', children: catagoryApartment!),
                        AdsListViewShowcaseWidget(
                            title: 'House', children: catagoryHouse!),
                        AdsListViewShowcaseWidget(
                            title: 'Hostel', children: catagoryHostel!),
                        AdsListViewShowcaseWidget(
                            title: 'Paying Guests',
                            children: catagoryPayingGuest!),
                      ],
                    ),
                  ),
                ],
              )
            : const LoadingWidget());
  }
}
