import 'package:flutter/material.dart';

import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias; 

  ListaNoticias({
    this.noticias
  }); 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(
          index: index,
          noticia: this.noticias[index],
        );
      }
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  _Noticia({
    this.noticia,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        _TarjetaTopBar(
          noticia: noticia,
          index: index,
        ),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia: noticia),
        _TarjetaBotones(),
        SizedBox(height: 10.0),
        Divider()
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)  
            ),
            child: Icon(Icons.star_border)
          ),  
          SizedBox(width: 10.0),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)  
            ),
            child: Icon(Icons.more)
          ),  
        ],
      )
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  _TarjetaBody({ this.noticia });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        noticia.description ?? 'Descripción no disponible',
      )
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  _TarjetaImagen({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0)
        ),
        child: Container(
          child: noticia.urlToImage != null ?
            FadeInImage(
              placeholder: AssetImage('assets/images/giphy.gif'),
              image: NetworkImage(noticia.urlToImage)
            ) 
            : Image(image: AssetImage('assets/images/no-image.png'))      
        ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  _TarjetaTitulo({this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(noticia.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700))
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  _TarjetaTopBar({
    this.noticia,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text('${index + 1}. ',
            style: TextStyle(
              color: miTema.accentColor
            ),
          ),
          Text('${noticia.source.name}')
        ],
      ),
    );
  }
}