import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/appbar_widget.dart';

class RentScreen extends StatelessWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('RENT APP'),
        ),
        body: const Center(child: Text("Contact The Owner For More Details")),
      ),
    );
  }
}
