import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'package:qr_reader_app/src/providers/db_provider.dart';

abrirScan(ScanModel scan, BuildContext context) async {
  if(scan.tipo == 'http') {
    final url = scan.valor;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else
    Navigator.pushNamed(context, 'mapa', arguments: scan);
}