import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/news_card.dart';
import 'package:wakelock/wakelock.dart';

import 'package:flutter_news/models/article_model.dart';
import 'category_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.category}) : super(key: key);

  final String? category;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<Article> news = [];
  bool _loading = true;

  String appBarTitle = "";

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    if (widget.category == null) {
      categories = getCategories();
      appBarTitle = "Flutter";
    } else {
      appBarTitle = "${widget.category}";
    }
    getNews(category: widget.category);
  }

  getNews({String? category}) async {
    news = await getArticles(category: category);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              appBarTitle,
              style: const TextStyle(color: Colors.black),
            ),
            const Text(
              " News", // space between two words
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    widget.category != null
                        ? const SizedBox(
                            height: 0,
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            height: 60,
                            child: ListView.builder(
                              itemBuilder: ((context, index) {
                                return CategoryTile(
                                  imageURL: categories[index].imageURL,
                                  categoryName: categories[index].categoryName,
                                );
                              }),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                            ),
                          ),
                    ListView.builder(
                      itemBuilder: ((context, index) {
                        return NewsCard(
                            cardTitle: news[index].title ?? "",
                            imageURL: news[index].urlToImage ?? "",
                            desc: news[index].description ?? "",
                            articleUrl: news[index].url ?? "");
                      }),
                      itemCount: news.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
