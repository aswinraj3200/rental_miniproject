import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rentalapp/Layouts/screen_layouts.dart';

import 'package:rentalapp/Screens/signin_screen.dart';
import 'package:rentalapp/provider/userdetail_provider.dart';

import 'package:rentalapp/utils/colour_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAp_QT53JaMOfBvFZwAoCEB052O-oA8CH0",
            authDomain: "rentalmanagement-1ce91.firebaseapp.com",
            projectId: "rentalmanagement-1ce91",
            storageBucket: "rentalmanagement-1ce91.appspot.com",
            messagingSenderId: "538541617493",
            appId: "1:538541617493:web:d47b4c9139bcf2c0d33fdc"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const RentalApp());
}

class RentalApp extends StatelessWidget {
  const RentalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'RENTAL_APP',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              );
            } else if (user.hasData) {
              return const ScreenLayouts();
            } else {
              return const SignInScreeen();
            }
          },
        ),
      ),
    );
  }
}
