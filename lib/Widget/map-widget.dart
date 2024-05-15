import 'package:flutter/material.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';

class MapWidget extends StatefulWidget {
  late final (int, int) matrixSize;
  late final List<BoothWidget> boothsList;
  late GridMap gridMapEntity;

  MapWidget({super.key, required this.matrixSize, required this.boothsList}) {
    gridMapEntity = GridMap.AllWalkable(matrixSize.$1, matrixSize.$2);
    print("Classe publica");
  }
  @override
  State<MapWidget> createState() =>
      _MapWidgetState(matrixSize, boothsList, gridMapEntity);
}

class _MapWidgetState extends State<MapWidget> {
  late List<Widget> renderizedGrid;

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 30, children: renderizedGrid);
  }

  _MapWidgetState((int, int) matrixSize, List<BoothWidget> boothsList,
      GridMap gridMapEntity) {
    renderizedGrid = List<Widget>.generate(
        matrixSize.$1 * matrixSize.$2,
        (index) => Container(
              color: Colors.white,
            ),
        growable: false);

    //Criar os estandes baseado na lista de estandes
  }
}
