import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('Notifcation'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.backspace)),
        ),
        body: const Center(child: Text('NOTIFICATIONSCREEN')),
        //here we can add location of user
      ),
    );
  }
}
