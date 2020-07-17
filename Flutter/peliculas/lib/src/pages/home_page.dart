import 'package:flutter/material.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/movies_horizontal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        backgroundColor: Colors.indigoAccent,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(), 
            _footer(context)
          ],
        ),
      )
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if(snapshot.hasData)
          return new CardSwiper(peliculas: snapshot.data);
        else 
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
      },
    );
    /*peliculasProvider.getEnCines();
    return new CardSwiper(peliculas: [1, 2, 3, 4, 5]);*/
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,//Toma todo el espacio
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subtitle1),
          ),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if(snapshot.hasData)
                return new MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares,  
                );
              return Container(
                height: 100.0,
                child: Center(
                child: CircularProgressIndicator()
              )
          );
            },
          ),
        ],
      ),
    );
  }

  final PeliculasProvider peliculasProvider = new PeliculasProvider();
}