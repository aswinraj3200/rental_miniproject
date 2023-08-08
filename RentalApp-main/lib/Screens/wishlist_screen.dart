import 'package:flutter/material.dart';

import 'package:rentalapp/widgets/wishlistfav_widget.dart';

import '../widgets/appbar_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('Wishlists'),
        ),
        body: Center(
          child: Column(
            children: const [
              YourWishlistWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
