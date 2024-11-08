import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bandname/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 3),
    Band(id: '3', name: 'Los prisioneros', votes: 3),
    Band(id: '4', name: 'La mosca', votes: 1),
    Band(id: '5', name: 'chanchito feliz', votes: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Band Names',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: ListView.builder(
            itemCount: bands.length,
            itemBuilder: (BuildContext context, int index) =>
                _bandTile(bands[index])),
        floatingActionButton: FloatingActionButton(
            elevation: 1, onPressed: addNewBand, child: const Icon(Icons.add)));
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) {
        // TODO llamar el borrado en el server
      },
      background: Container(
          padding: const EdgeInsets.only(left: 8),
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Delete Band',
              style: TextStyle(color: Colors.white),
            ),
          )),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5,
                  onPressed: () => addBandToList(textController.text),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          );
        },
      );
    }

    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: const Text('New Band Name'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => addBandToList(textController.text),
                  child: const Text('Add')),
              CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Dismiss')),
            ],
          );
        });
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      setState(() {
        bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
      });
    }

    Navigator.pop(context);
  }
}
