// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:rentalapp/Screens/signup_screen.dart';
import 'package:rentalapp/resources/authentication_methods.dart';
import 'package:rentalapp/utils/utils.dart';
import 'package:rentalapp/widgets/custombutton_widget.dart';
import 'package:rentalapp/widgets/customlongbutton_widget.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/textfield_widget.dart';

class SignInScreeen extends StatefulWidget {
  const SignInScreeen({Key? key}) : super(key: key);

  @override
  State<SignInScreeen> createState() => _SignInScreeenState();
}

class _SignInScreeenState extends State<SignInScreeen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isloading = false;
  @override
  dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('RENT APP'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/horizontallisticons/houseicon.png',
                      height: screenSize.height * .12),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: screenSize.height * .4,
                      width: screenSize.width * .7,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          TextFieldWidget(
                              title: 'Email',
                              controller: emailController,
                              obscureText: false,
                              hintText: 'username'),
                          TextFieldWidget(
                              title: 'Password',
                              controller: passwordController,
                              obscureText: true,
                              hintText: 'Password'),
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButtonWidget(
                                color: Colors.red,
                                isLoading: isloading,
                                onPressed: () async {
                                  setState(() {
                                    isloading = true;
                                  });
                                  String output =
                                      await authenticationMethods.signInUser(
                                          email: emailController.text,
                                          password: passwordController.text);

                                  setState(() {
                                    isloading = false;
                                  });

                                  if (output == 'success') {
                                    //functions
                                  } else {
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.black, letterSpacing: 2),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.grey[800], letterSpacing: 2),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  CustomLongButtonWidget(
                    color: Colors.grey,
                    isLoading: false,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => const SignUpScreeen())));
                    },
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(
                          color: Colors.black,
                          wordSpacing: 5,
                          letterSpacing: 2),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
