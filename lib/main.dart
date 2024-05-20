import 'package:flutter/material.dart';
import 'package:projeto_integrador/PathFinding/AllBoothsMap.dart';
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
        home: MapWidget(
            boothsList: AllBoothsMap.GetAllBoothsList(), matrixSize: (59, 30)));
  }
}
