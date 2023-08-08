class ProductModel {
  final String imgurl;
  final String productname;
  final String catagory;
  final String price;
  final String uid;
  final String rentedby;
  final String rentedbyuid;
  final String address;
  final String description;
  final String phno;

  ProductModel({
    required this.uid,
    required this.imgurl,
    required this.productname,
    required this.catagory,
    required this.price,
    required this.rentedbyuid,
    required this.rentedby,
    required this.address,
    required this.description,
    required this.phno,
  });

  Map<String, dynamic> getJson() {
    return {
      'url': imgurl,
      'productName': productname,
      'catagory': catagory,
      'price': price,
      'uid': uid,
      'rentedby': rentedby,
      'rentedbyuid': rentedbyuid,
      'address': address,
      'description': description,
      'phno': phno,
    };
  }

  factory ProductModel.getModelFromJson({required Map<String, dynamic> json}) {
    return ProductModel(
      uid: json["uid"],
      imgurl: json["url"],
      productname: json["productName"],
      catagory: json["catagory"],
      price: json["price"],
      rentedbyuid: json["rentedbyuid"],
      rentedby: json["rentedby"],
      address: json["address"],
      description: json["description"],
      phno: json["phno"],
    );
  }
}
