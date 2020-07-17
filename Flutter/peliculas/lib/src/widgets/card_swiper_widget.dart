import 'package:flutter/material.dart'; 
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    //Para tener info del ancho y alto del dispositivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
     
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: AssetImage('assets/no-image.jpg'),
              fit: BoxFit.cover
            ) 
          );
        },  
        
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemCount: peliculas.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
        layout: SwiperLayout.STACK, 
      ),
    );
  }

  final List<Pelicula> peliculas;
}