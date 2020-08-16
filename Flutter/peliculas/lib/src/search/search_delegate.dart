import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) { //Son las acciones del appBar
      return <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          } ,
        ),
      ]; 
  }
  
  @override
  Widget buildLeading(BuildContext context) { //Icono a la izquierda del appBar 
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,  
        progress: transitionAnimation,
      ),

      onPressed: () {
        close(context, null);
      },
    );
  }
  
  @override
  Widget buildResults(BuildContext context) { //Crea los resultados
    return Container();
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {//Son las sugerencias que aparecen cuando se escribe
    if(query.isEmpty) 
      return Container();
    
    return FutureBuilder(
      future: peliculasProvider.buscarPeliculas(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData) {
          final peliculas = snapshot.data;

          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),

                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  close(context , null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                },
              );
            }).toList(),
          );
        } else 
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  final PeliculasProvider peliculasProvider = new PeliculasProvider();
}