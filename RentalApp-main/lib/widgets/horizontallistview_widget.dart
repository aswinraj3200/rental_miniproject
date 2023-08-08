import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/result_screen.dart';
import 'package:rentalapp/utils/constants.dart';

class HorizontalListViewBar extends StatelessWidget {
  const HorizontalListViewBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        query: categoriesList[index],
                      );
                    },
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image.asset(categoryLogos[index]),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(categoriesList[index])),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
