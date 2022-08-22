import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key? key,
      required this.cardTitle,
      required this.imageURL,
      required this.desc})
      : super(key: key);

  final String cardTitle, imageURL, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CachedNetworkImage(imageUrl: imageURL),
        Text(cardTitle),
        Text(desc)
      ]),
    );
  }
}
