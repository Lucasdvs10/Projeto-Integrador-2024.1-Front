import 'package:flutter/material.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';
import 'package:projeto_integrador/Widget/map-widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
          useMaterial3: true,
        ),
        home: MapWidget(boothsList: [
          BoothWidget(
            color: Colors.green,
            onPressed: () {},
            superiorLeftPoint: (0, 10),
            inferiorRightPoint: (3, 13),
            entryBoothPoint: (3, 11),
          ),
          BoothWidget(
            color: Colors.red,
            onPressed: () {},
            superiorLeftPoint: (7, 10),
            inferiorRightPoint: (11, 13),
            entryBoothPoint: (11, 11),
          ),
          BoothWidget(
            color: Colors.yellow[800]!,
            onPressed: () {},
            superiorLeftPoint: (0, 17),
            inferiorRightPoint: (3, 20),
            entryBoothPoint: (11, 11),
          )
        ], matrixSize: (
          30,
          59
        )));
  }
}
