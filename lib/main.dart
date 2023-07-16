import 'package:flutter/material.dart';
import 'package:proyectofinal2/pagi.dart';

void main() => runApp(Tareapp());

class Tareapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tarea App",
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      debugShowCheckedModeBanner: false,
      home: pagi(),
    );

  }
}



