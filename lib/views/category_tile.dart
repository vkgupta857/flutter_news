import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, this.imageURL, this.categoryName})
      : super(key: key);

  final imageURL, categoryName;

  final double width = 100, height = 60;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.blue),
        margin: const EdgeInsets.only(right: 8),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageURL,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black38,
            ),
            alignment: Alignment.center,
            child: Text(
              categoryName,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
