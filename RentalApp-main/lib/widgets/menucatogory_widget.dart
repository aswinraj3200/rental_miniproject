import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/rentproperty_screen.dart';
import 'package:rentalapp/utils/constants.dart';

class MenuCatagoryListWidget extends StatelessWidget {
  final int index;
  const MenuCatagoryListWidget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        if (index == 0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return const RentPropertyScreen();
              },
            ),
          );
        }
      }),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ]),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                menuCategoryLogos[index],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  menuCategoryLists[index],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
