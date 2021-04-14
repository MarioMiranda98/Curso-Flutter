import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:news_provider/src/pages/tabs_page.dart';
import 'package:news_provider/src/theme/tema.dart';
import 'package:news_provider/src/services/news_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: miTema,
        home: TabsPage()
      ),
    );
  }
}