import 'package:flutter/material.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';

class AllBoothsMap {
  static List<BoothWidget> GetAllBoothsList() {
    return [
      BoothWidget(
        color: Colors.green,
        superiorLeftPoint: (0, 10),
        inferiorRightPoint: (3, 13),
      ),
      BoothWidget(
        color: Colors.red,
        superiorLeftPoint: (7, 10),
        inferiorRightPoint: (11, 13),
      ),
      BoothWidget(
        color: Colors.yellow[800]!,
        superiorLeftPoint: (0, 17),
        inferiorRightPoint: (3, 20),
        entryBoothPoint: (4, 18),
      ),
      BoothWidget(
        color: Colors.green,
        superiorLeftPoint: (0, 10),
        inferiorRightPoint: (3, 13),
      ),
    ];
  }
}
