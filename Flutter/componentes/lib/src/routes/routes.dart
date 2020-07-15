import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/card_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder> {
      '/' : (BuildContext context) => new HomePage(),
      'alert' : (BuildContext context) => new AlertPage(),
      'avatar' : (BuildContext context) => new AvatarPage(),
      'card' : (BuildContext context) => new CardPage()  
  };
}