import 'package:flutter/material.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';

class AllBoothsMap {
  static List<BoothWidget> GetAllBoothsList() {
    return [
      BoothWidget(
        color: Colors.green,
        superiorLeftPoint: (0, 10),
        sizes: (4, 4),
      ),
      BoothWidget(
        color: Colors.red,
        superiorLeftPoint: (7, 10),
        sizes: (4, 4),
      ),
      BoothWidget(
        color: Colors.yellow[800]!,
        superiorLeftPoint: (0, 17),
        sizes: (4, 4),
        entryBoothPoint: (0, 16),
      ),
      BoothWidget(
        color: Colors.green,
        superiorLeftPoint: (0, 10),
        sizes: (4, 4),
      ),
    ];
  }
}
