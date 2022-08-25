import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/views/home.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {Key? key, required this.imageURL, required this.categoryName})
      : super(key: key);

  final String imageURL, categoryName;

  final double width = 100, height = 60;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Home(
                      category: categoryName,
                    ))));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.blue),
        margin: const EdgeInsets.only(right: 8),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageURL,
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
