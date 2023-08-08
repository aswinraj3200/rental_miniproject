import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/yourrenting_screen.dart';

import '../widgets/appbar_widget.dart';

class PostedAdsScreen extends StatelessWidget {
  const PostedAdsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('PostedAds'),
        ),
        body: Center(
          child: Column(
            children: const [
              YourRentingScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
