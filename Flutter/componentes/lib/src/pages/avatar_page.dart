import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[//Lista de widgets para la appBar

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/en/9/99/Kenshiro_%28Hokuto_no_Ken_Kyukyokuban%29.jpg'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://los40es00.epimg.net/los40/imagenes/2019/04/10/comics/1554906740_047827_1554906817_noticia_normal.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200)
        ),
      )
    );
  }
}