import 'package:flutter/material.dart';

import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:qr_reader_app/src/utils/utils.dart';

class DireccionesPage extends StatelessWidget {
  final scansBloc = ScansBloc();
  @override
  Widget build(BuildContext context) {
    scansBloc.obtenerScans();
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if(!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        else {
          final scans = snapshot.data;
          if(scans.length == 0) 
            return Center(child: Text('No hay informacion'));
          
          return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                scansBloc.borrarScan(scans[index].id);
              },
              child: ListTile(
                onTap: () => abrirScan(scans[index], context),
                leading: Icon(
                  Icons.cloud_queue,
                  color: Theme.of(context).primaryColor,  
                ),
                title: Text(scans[index].valor),
                subtitle: Text('ID: ${scans[index].id}'),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              ),
            )
          );
        }
      }
    );
  }
}