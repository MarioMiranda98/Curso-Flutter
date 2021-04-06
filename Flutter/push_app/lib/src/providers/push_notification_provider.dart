import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajesStream => this._mensajesStreamController.stream;

  initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume
    );
  }


  static Future<dynamic> onBackgroundMessage(Map<String, dynamic> message) {
    if(message.containsKey('data')) {
      final dynamic data  = message['data'];
    }

    if(message.containsKey('notification')) {
      final dynamic notification = message['notification'];
    }
  }


  Future<dynamic> onMessage(Map<String, dynamic> message) {
    // print('On Message');
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) {
    // print('On Launch');
    final argumento = message['data']['comida'];
    _mensajesStreamController.sink.add(argumento);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) {
    // print('On Resume');
    final argumento = message['data']['comida'] ?? 'no-data';
    _mensajesStreamController.sink.add(argumento);
  }

  void dispose() {
    _mensajesStreamController?.close();
  }
}