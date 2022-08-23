import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape_small.dart';

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
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: imageURL == ""
            ? null
            : Column(children: [
                CachedNetworkImage(imageUrl: imageURL),
                const SizedBox(
                  height: 8,
                ),
              ]),
      ),
      Text(
        cardTitle,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        child: desc == ""
            ? null
            : Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    HtmlUnescape().convert(desc.trim()),
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              ),
      ),
      const Divider(
        color: Colors.black38,
      )
    ]);
  }
}
