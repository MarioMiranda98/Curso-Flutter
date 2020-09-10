import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:qr_reader_app/src/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final MapController mapController = MapController();
  String tipoMapa = 'streets-v11';

  @override
  Widget build(BuildContext context) {
    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapController.move(scanModel.getLatLng(), 10);
            },
          ),
        ],
      ),
      body: _crearFlutterMap(scanModel),
      floatingActionButton: _crearBotonFlotante(context, scanModel),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 10
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
    );
  }

  LayerOptions _crearMapa() {
    return TileLayerOptions(
      urlTemplate:'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoibWFyaW8tbWlyYW5kYSIsImEiOiJja2V3OXdlbGkwOGc2MnVtZmdwMGJ1dnFqIn0.hGfwaXg5ftbmmmeF26-luQ',
        'id': 'mapbox/$tipoMapa'
      }
    );
  }

  LayerOptions _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker> [
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (BuildContext context) {
            return Container(
              child: Icon(
                Icons.location_on, 
                size: 60.0,
                color: Theme.of(context).primaryColor,
              )
            );
          }
        ),
      ],
    );
  }

  Widget _crearBotonFlotante(BuildContext context, ScanModel scanModel) {
    return FloatingActionButton(
      onPressed: () {
        if(tipoMapa == 'streets-v11') 
          tipoMapa = 'outdoors-v11';
        else if(tipoMapa == 'outdoors-v11')
          tipoMapa = 'light-v10';
        else if(tipoMapa == 'light-v10')
          tipoMapa = 'dark-v10';
        else if(tipoMapa == 'dark-v10')
          tipoMapa = 'satellite-v9';
        else if(tipoMapa == 'satellite-v9')
          tipoMapa = 'satellite-streets-v11';
        else if(tipoMapa == 'satellite-streets-v11')
          tipoMapa = 'streets-v11';

        setState(() {});

        mapController.move(scanModel.getLatLng(), 10);
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.repeat),
    );
  }
}