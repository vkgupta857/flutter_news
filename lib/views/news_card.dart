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
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(imageUrl: imageURL),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          cardTitle,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          desc,
          style: const TextStyle(color: Colors.grey),
        ),
        const Divider()
      ]),
    );
  }
}
