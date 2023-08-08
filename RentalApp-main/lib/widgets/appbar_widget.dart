import 'package:flutter/material.dart';

import '../utils/colour_theme.dart';
import '../utils/constants.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: backgroundGradient,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
    );
  }
}
