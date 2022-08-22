import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/models/article_model';

List<CategoryModel> getCategories() {
  List<CategoryModel> myCategories = [];
  CategoryModel categorieModel;

  //1
  categorieModel = CategoryModel();
  categorieModel.categoryName = "Business";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  myCategories.add(categorieModel);

  //2
  categorieModel = CategoryModel();
  categorieModel.categoryName = "Entertainment";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //3
  categorieModel = CategoryModel();
  categorieModel.categoryName = "General";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  myCategories.add(categorieModel);

  //4
  categorieModel = CategoryModel();
  categorieModel.categoryName = "Health";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = CategoryModel();
  categorieModel.categoryName = "Science";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = CategoryModel();
  categorieModel.categoryName = "Sports";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  //5
  categorieModel = CategoryModel();
  categorieModel.categoryName = "Technology";
  categorieModel.imageURL =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  myCategories.add(categorieModel);

  return myCategories;
}

Future<List<Article>> getArticles() async {
  List<Article> articles = [];
  String url =
      "https://newsapi.org/v2/everything?q=apple&from=2022-08-21&to=2022-08-21&sortBy=popularity&apiKey=3aaff2fa0a7d409eb5f8e4132dbc74a0";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print(response.body);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        var article = Article(
            urlToImage: element['urlToImage'],
            title: element['title'],
            description: element['description']);
        articles.add(article);
      });
    }
  }
  return articles;
}
