import 'package:flutter/material.dart';
import 'package:rentalapp/model/userdetails_model.dart';
import '../resources/cloudfirestore_methods.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails =
            UserDetailsModel(name: "Loading....", address: "Loading....");

  Future<void> getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
