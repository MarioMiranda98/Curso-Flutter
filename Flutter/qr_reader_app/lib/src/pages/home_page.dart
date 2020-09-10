import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qr_reader_app/src/pages/direcciones_page.dart';
import 'package:qr_reader_app/src/pages/mapas_page.dart';
import 'package:qr_reader_app/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indiceActual = 0;
  final scansBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarScansTodos,
          ),
        ],
      ),
      body: _cargarPage(indiceActual),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  BottomNavigationBar _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: indiceActual,
      onTap: (int index) {
        setState(() {
          indiceActual = index;
        });
      },
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones'),
        ),
      ],
    );
  }

  Widget _cargarPage(int paginaActual) {
    switch(paginaActual) {
      case 0:
        return MapasPage();
        break;
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapasPage();
        break;
    }
  }

  _scanQR(BuildContext context) async {
    dynamic futureString;

    try {
       futureString = await BarcodeScanner.scan();
    }catch(e) {
       futureString = e.toString();
       futureString = null;
    }

    if(futureString != null) {
      final scan = ScanModel(valor: futureString.rawContent);
      scansBloc.agregarScan(scan);
      abrirScan(scan, context);
    }
  }
}