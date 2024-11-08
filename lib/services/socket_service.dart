import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    Socket socket = io(
        'http://192.168.1.7:3000',
        OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .enableReconnection()
            .build());

    socket.onConnect((_) {
      print('connect');
    });

    socket.onDisconnect((_) => print('disconnect'));
  }
}
