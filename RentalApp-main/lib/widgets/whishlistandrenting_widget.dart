import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/postedads_screen.dart';
import 'package:rentalapp/Screens/wishlist_screen.dart';

import 'package:rentalapp/utils/constants.dart';

import '../utils/colour_theme.dart';

class WishlistAndRentingWidget extends StatefulWidget {
  const WishlistAndRentingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WishlistAndRentingWidget> createState() =>
      _WishlistAndRentingWidgetState();
}

class _WishlistAndRentingWidgetState extends State<WishlistAndRentingWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: kAppBarHeight * 2,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: SizedBox(
                  height: kAppBarHeight - 5,
                  width: screenSize.width / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return const WishlistScreen();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 250, 152, 145),
                    ),
                    child: const Text(
                      "Wishlist",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                    ),
                  ))),
          const Divider(
            color: Colors.blueGrey,
            thickness: 2,
          ),
          Expanded(
            child: SizedBox(
              height: kAppBarHeight / 2,
              width: screenSize.width,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: lightBackgroundaGradient,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const PostedAdsScreen())));
                    }),
                    child: const Text(
                      "Posted Ads",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2,
                          wordSpacing: 4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
