import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader_app/src/models/scan_model.dart';
export 'package:qr_reader_app/src/models/scan_model.dart';

class DBProvider {
  static Database _dataBase;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if(_dataBase != null) return _dataBase;
    _dataBase = await initDB();

    return _dataBase;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(
      path, 
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY,'
          ' tipo TEXT,'
          ' valor TEXT' 
          ')'
        );
      }
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.rawInsert(
      "INSERT INTO Scans (id, tipo, valor) "
      "VALUES (${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')"
    );

    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    
    return res;
  }

  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query(
      'Scans',
      where: 'id = ?',
      whereArgs: [id] 
    );

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosScans() async {
    final db = await database;
    final res = await db.query('Scans');

    List<ScanModel> lista = res.isNotEmpty ? res.map(
      (scans) => ScanModel.fromJson(scans)).toList() 
      : [];
    
    return lista;
  } 

  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery(
      "SELECT * FROM Scans WHERE tipo = '$tipo'"
    );

    List<ScanModel> lista = res.isNotEmpty ? res.map(
      (scans) => ScanModel.fromJson(scans)).toList() 
      : [];
    
    return lista;
  } 

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update(
      'Scans',
      nuevoScan.toJson(),
      where: 'id = ?',
      whereArgs: [nuevoScan.id]
    );

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete(
      'Scans',
      where: 'id = ?',  
      whereArgs: [id]
    );

    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete(
      "DELETE FROM Scans"
    );

    return res;
  }
}