import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bandname/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sockerService = Provider.of<SocketService>(context);
    return const Scaffold(
      body: Center(
        child: Text('Status Page'),
      ),
    );
  }
}
