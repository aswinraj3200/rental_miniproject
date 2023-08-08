import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/yourrenting_screen.dart';

import 'package:rentalapp/widgets/user_accountdetails_widget.dart';
import 'package:rentalapp/widgets/whishlistandrenting_widget.dart';

import '../widgets/appbar_widget.dart';
import 'notification_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<Widget>? postedAds;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('Account'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const NotificationScreen())));
                },
                icon: const Icon(Icons.notifications))
          ],
        ),
        body: Center(
          child: Column(children: const [
            UserAccountDetailWidget(),
            WishlistAndRentingWidget(),
            YourRentingScreen()
          ]),
        ));
  }
}
