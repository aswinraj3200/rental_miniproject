import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/signin_screen.dart';
import 'package:rentalapp/resources/authentication_methods.dart';
import 'package:rentalapp/utils/utils.dart';

import 'package:rentalapp/widgets/custombutton_widget.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/customlongbutton_widget.dart';
import '../widgets/textfield_widget.dart';

class SignUpScreeen extends StatefulWidget {
  const SignUpScreeen({Key? key}) : super(key: key);

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isloading = false;

  @override
  dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: AppBarWidget(),
          title: const Text('Sign UP Page'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: (screenSize.height) + 14,
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
                    child: SizedBox(
                      height: screenSize.height * .8,
                      width: screenSize.width * .8,
                      child: FittedBox(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: (screenSize.height * .7),
                          width: screenSize.width * .8,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              TextFieldWidget(
                                  title: 'Name',
                                  controller: nameController,
                                  obscureText: false,
                                  hintText: 'Enter your name'),
                              TextFieldWidget(
                                  title: 'Email',
                                  controller: emailController,
                                  obscureText: false,
                                  hintText: 'Enter your Email'),
                              TextFieldWidget(
                                  title: 'Password',
                                  controller: passwordController,
                                  obscureText: true,
                                  hintText: 'Enter your password'),
                              TextFieldWidget(
                                  title: 'Address',
                                  controller: addressController,
                                  obscureText: false,
                                  hintText: 'Enter address'),
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
                                        await authenticationMethods.signUpUser(
                                            name: nameController.text,
                                            address: addressController.text,
                                            email: emailController.text,
                                            password: passwordController.text);
                                    setState(() {
                                      isloading = false;
                                    });
                                    if (output == "success") {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const SignInScreeen()));
                                    } else {
                                      Utils().showSnackBar(
                                          context: context, content: output);
                                    }
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.black, letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CustomLongButtonWidget(
                      color: Colors.grey,
                      isLoading: false,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: ((context) => const SignInScreeen()),
                          ),
                        );
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.black,
                            wordSpacing: 5,
                            letterSpacing: 2),
                      ),
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
