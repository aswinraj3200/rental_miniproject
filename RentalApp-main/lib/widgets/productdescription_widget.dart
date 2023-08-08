import 'package:flutter/material.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final String description;
  const ProductDescriptionWidget({
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Description",
            style: TextStyle(fontSize: 17),
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            width: screenSize.width,
            child: Text(
              description,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 0.2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );
  }
}
