import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rentalapp/resources/cloudfirestore_methods.dart';
import 'package:rentalapp/widgets/custombutton_widget.dart';
import 'package:rentalapp/widgets/loading_widget.dart';
import 'package:rentalapp/widgets/textfield_widget.dart';

import '../provider/userdetail_provider.dart';
import '../utils/utils.dart';

class RentPropertyScreen extends StatefulWidget {
  const RentPropertyScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RentPropertyScreen> createState() => _RentPropertyScreenState();
}

class _RentPropertyScreenState extends State<RentPropertyScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phnoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool isloading = false;
  int selected = 1;
  Uint8List? image;
  List<String> keysForCatagory = [
    "Apartment",
    "House",
    "Hostel",
    "Paying Guest"
  ];

  @override
  dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    phnoController.dispose();
    descriptionController.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: !isloading
            ? SingleChildScrollView(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              image == null
                                  ? Image.asset(
                                      "assets/images/defaultimages/default-image.jpg",
                                      height: screenSize.height / 5,
                                    )
                                  : Image.memory(
                                      image!,
                                      height: screenSize.height / 5,
                                    ),
                              IconButton(
                                  onPressed: () async {
                                    Uint8List? temp = await Utils().pickImage();
                                    if (temp != null) {
                                      setState(() {
                                        image = temp;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.file_upload))
                            ],
                          ),
                          Container(
                            height: (screenSize.height * .90) + 27,
                            width: screenSize.width * 0.80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFieldWidget(
                                        title: "Property Name",
                                        controller: nameController,
                                        obscureText: false,
                                        hintText: "Enter Property Name"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Text(
                                            "Property Address",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          controller: addressController,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText: "Enter Property Address",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.orange,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: TextFieldWidget(
                                        title: "Owners Contact Detail",
                                        controller: phnoController,
                                        obscureText: false,
                                        hintText: "Enter Contact Number"),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Catagory",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text("Apartment"),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text("House"),
                                    leading: Radio(
                                      value: 2,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text("Hostel"),
                                    leading: Radio(
                                      value: 3,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text("Paying Guests"),
                                    leading: Radio(
                                      value: 4,
                                      groupValue: selected,
                                      onChanged: (int? i) {
                                        setState(() {
                                          selected = i!;
                                        });
                                      },
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 15, left: 15),
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 8,
                                                spreadRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child: TextField(
                                            controller: descriptionController,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              hintText: "Description",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.orange,
                                                  width: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: TextFieldWidget(
                                            title: "Price",
                                            controller: priceController,
                                            obscureText: false,
                                            hintText: "Enter Price"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomMainButtonWidget(
                                color: const Color.fromARGB(255, 249, 110, 100),
                                isLoading: isloading,
                                onPressed: () async {
                                  setState(() {
                                    isloading = true;
                                  });
                                  String output = await CloudFirestoreClass()
                                      .uplaodProductToDatabase(
                                          address: addressController.text,
                                          image: image,
                                          productname: nameController.text,
                                          catagory:
                                              keysForCatagory[selected - 1],
                                          price: priceController.text,
                                          rentedby:
                                              Provider.of<UserDetailsProvider>(
                                                      context,
                                                      listen: false)
                                                  .userDetails
                                                  .name,
                                          rentedbyuid: FirebaseAuth
                                              .instance.currentUser!.uid,
                                          phno: phnoController.text,
                                          description:
                                              descriptionController.text);

                                  if (output == "success") {
                                    Utils().showSnackBar(
                                        context: context,
                                        content: "Posted Sucessfully");
                                    setState(() {
                                      isloading = false;
                                    });
                                  } else {
                                    setState(() {
                                      isloading = false;
                                    });

                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                                child: const Text("Uplaod")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomMainButtonWidget(
                              color: const Color.fromARGB(255, 190, 188, 188),
                              isLoading: false,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Back"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const LoadingWidget(),
      ),
    );
  }
}
