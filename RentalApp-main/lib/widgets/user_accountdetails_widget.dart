import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentalapp/model/userdetails_model.dart';
import 'package:rentalapp/provider/userdetail_provider.dart';

import 'package:rentalapp/utils/constants.dart';

import '../utils/colour_theme.dart';

class UserAccountDetailWidget extends StatelessWidget {
  const UserAccountDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetails =
        Provider.of<UserDetailsProvider>(context).userDetails;
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: lightBackgroundaGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      height: (screenSize.height / 8) + 26,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello  ',
                    style: TextStyle(fontSize: 27, color: Colors.grey[800]),
                  ),
                  TextSpan(
                    text: userDetails.name,
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                ],
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "Address : "),
                  TextSpan(text: userDetails.address),
                ],
              ),
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: SizedBox(
              width: 100,
              height: 100,
              child: ClipOval(
                child: Image.asset(
                  userImage,
                ),
              ),
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
      ),
    );
  }
}
