import 'package:flutter/material.dart';
import 'package:rentalapp/Screens/account_screen.dart';
import 'package:rentalapp/Screens/home_screen.dart';
import 'package:rentalapp/Screens/menu_screen.dart';
import 'package:rentalapp/widgets/simpleadsimage.dart';

import '../model/product_model.dart';

const double kAppBarHeight = 80;

const String userName = 'Person1';

const String userImage = "assets/images/userinfo/person1.png";

const String userMailid = 'abcdef@gmail.com';

const String userContactno = '9876543210';

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  MenuScreen(),
];

const List<String> categoriesList = [
  "Apartment",
  "House",
  "Hostel",
  "Paying Guest"
];

const List<String> categoryLogos = [
  "assets/images/horizontallisticons/Apartmenticon.png",
  "assets/images/horizontallisticons/houseicon.png",
  "assets/images/horizontallisticons/hostelicon.png",
  "assets/images/horizontallisticons/PGicon.png",
];

List<Widget> testChildern1 = [
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  )
];
List<Widget> testChildern2 = [
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
];

List<Widget> testChildern3 = [
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
  SampleAdsImage(
    productModel: ProductModel(
      imgurl: "assets/images/sampleads/apartment1.jpg",
      productname: "High End Apartment",
      catagory: "Apartment",
      price: "20000",
      uid: "1",
      rentedby: "user2",
      rentedbyuid: "2",
      description: "",
      address: "",
      phno: "",
    ),
  ),
];

const List<String> menuCategoryLists = [
  "Rent Property",
  "Settings",
  "Buying Guide",
  "Help Center",
  "Exit",
];

const List<String> menuCategoryLogos = [
  "assets/images/menucatagorylogos/rentPropertyIcon.png",
  "assets/images/menucatagorylogos/settings2icon.png",
  "assets/images/menucatagorylogos/guideicon.png",
  "assets/images/menucatagorylogos/helpicon.png",
  "assets/images/menucatagorylogos/exitappicon.png",
];
