import 'package:flutter/material.dart';
import 'package:rentalapp/utils/colour_theme.dart';

class AdsListViewShowcaseWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const AdsListViewShowcaseWidget(
      {Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height / 3;
    double titleHeight = 25;
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: titleHeight,
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 3),
                  child: Text(
                    'Show more..',
                    style: TextStyle(fontSize: 14, color: activeCyanColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height - (titleHeight + 26),
            width: screenSize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
