import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/models/category_model.dart';

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_KEY = '7643f78690344e07bf1931ea8d6e341b';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';
  bool _isLoading = true;

  List<CategoryModel> categories = [
    CategoryModel(
      icon: FontAwesomeIcons.building,
      name: 'business'
    ),
    CategoryModel(
      icon: FontAwesomeIcons.tv,
      name: 'entertainment'
    ),
    CategoryModel(
      icon: FontAwesomeIcons.addressCard,
      name: 'general'
    ),
    CategoryModel(
      icon: FontAwesomeIcons.headSideVirus,
      name: 'health'
    ),
    CategoryModel(
      icon: FontAwesomeIcons.vials,
      name: 'science'
    ),
    CategoryModel(
      icon: FontAwesomeIcons.volleyballBall,
      name: 'sports'
    ),
    CategoryModel(
      icon: FontAwesomeIcons.memory,
      name: 'technology'
    ),
  ];

  Map<String, List<Article>> categoryArticles = {};
  
  NewsService() {
    this.getTopHeadlines();
    categories.forEach((item) {
      this.categoryArticles[item.name] = new List.empty(growable: true);
    });
  }

  get selectedCategory => this._selectedCategory;
  List<Article> get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory];
  bool get isLoading => this._isLoading;

  set selectedCategory(String value) {
    this._isLoading = true;
    this._selectedCategory = value;
    this.getArticlesByCategory(value);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=mx';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewsResponse.fromJson(json.decode(resp.body));

    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if(this.categoryArticles[category].length > 0) { 
      this._isLoading = false;
      notifyListeners();
      return this.categoryArticles[category];
    }

    final url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=mx&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewsResponse.fromJson(json.decode(resp.body));

    this.categoryArticles[category].addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }
} 