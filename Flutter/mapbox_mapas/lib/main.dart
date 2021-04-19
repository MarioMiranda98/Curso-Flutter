import 'package:flutter/material.dart';

import 'package:mapbox_mapas/src/pages/fullscreenmap.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapas',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FullScreenMap()
        ),
    );
  }
}