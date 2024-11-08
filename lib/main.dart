import 'package:bandname/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bandname/pages/home.dart';
import 'package:bandname/pages/status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'status',
        routes: {'home': (_) => HomePage(), 'status': (_) => StatusPage()},
      ),
    );
  }
}
