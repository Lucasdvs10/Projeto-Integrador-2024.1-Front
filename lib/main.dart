import 'package:flutter/material.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';

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
        home: BoothWidget(
          color: Colors.green,
          onPressed: () {
            print("Salve");
          },
          entryBoothPoint: (1, 1),
          superiorLeftPoint: (2, 2),
          inferiorRightPoint: (3, 3),
        ));
  }
}
