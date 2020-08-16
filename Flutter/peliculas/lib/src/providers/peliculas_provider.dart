import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PeliculasProvider {
  
  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language' : _language
    });

    return await _procesarRespuesta(url);
  }

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  Future<List<Pelicula>> getPopulares() async {
    if(_cargando) return [];

    _cargando = true;

    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    _cargando = false;

    return resp;
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    //Para hacer peticiones http
    final respuesta = await http.get(url);
    final decodeData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    return peliculas.items;
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3//movie/$peliId/credits', {
      'api_key' : _apiKey,
      'language' : _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final Cast cast = new Cast.fromJsonList(decodedData['cast']);


    return cast.actores;
  }

  Future<List<Pelicula>> buscarPeliculas(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key' : _apiKey,
      'language' : _language,
      'query' : query
    });

    return await _procesarRespuesta(url);
  }

  void disposeStream() {
    _popularesStream?.close();
  }

  String _apiKey = '7405387520ba28b5d90041d581d5460f';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';   
  int _popularesPage = 0;
  bool _cargando = false;
  List<Pelicula> _populares = new List();  

  //Para crear un Stream
  final _popularesStream = new StreamController<List<Pelicula>>.broadcast(); 
}