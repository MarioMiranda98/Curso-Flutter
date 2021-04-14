import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_provider/src/theme/tema.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/widgets/lista_noticias.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _ListaCategorias(),
            if(!newsService.isLoading) 
              Expanded(
                child: ListaNoticias(
                  noticias: newsService.getArticulosCategoriaSeleccionada
                )
              ),
            
            if(newsService.isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 100.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget> [
                _CategoryButton(category: categories[index]),
                SizedBox(height: 5.0),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ), 
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final CategoryModel category;

  const _CategoryButton({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          category.icon,
          color: newsService.selectedCategory == category.name ? miTema.accentColor : Colors.black54,
        )
      ),
    );
  }
}