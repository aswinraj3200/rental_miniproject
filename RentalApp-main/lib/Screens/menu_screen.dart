import 'package:flutter/material.dart';
import 'package:rentalapp/utils/constants.dart';
import 'package:rentalapp/widgets/menucatogory_widget.dart';

import '../widgets/appbar_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('Menu'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.2 / 3.5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15),
            itemCount: menuCategoryLists.length,
            itemBuilder: (context, index) =>
                MenuCatagoryListWidget(index: index),
          ),
        ));
  }
}
