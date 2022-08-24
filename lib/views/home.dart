import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/news_card.dart';
import 'package:wakelock/wakelock.dart';

import '../models/article_model';
import 'category_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<Article> news = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    news = await getArticles();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
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
                    Container(
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
