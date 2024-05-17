import 'package:flutter/material.dart';
import 'package:projeto_integrador/PathFinding/AStarCalculator.dart';
import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';

class MapWidget extends StatefulWidget {
  late final (int, int) matrixSize;
  late final List<BoothWidget> boothsList;
  late final GridMap gridMapEntity;

  MapWidget({super.key, required this.matrixSize, required this.boothsList}) {
    gridMapEntity = GridMap.AllWalkable(matrixSize.$1, matrixSize.$2);
  }
  @override
  State<MapWidget> createState() =>
      _MapWidgetState(matrixSize, boothsList, gridMapEntity);
}

class _MapWidgetState extends State<MapWidget> {
  late List<Widget> renderizedGrid;
  late List<Widget> pathlessGrid;
  late final AStarCalculator aStarCalculator;
  List<CellEntity> pathBeingRendered = [];

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 30, children: renderizedGrid);
  }

  void CalculateAndRenderPath((int, int) endPoint) {
    CalculatePath((0, 0), endPoint);
    RenderPath();
  }

  void CalculatePath((int, int) startPoint, (int, int) endPoint) {
    pathBeingRendered =
        aStarCalculator.CalculatePathByCoordinates(startPoint, endPoint);
  }

  void RenderPath() {
    setState(() {
      List<Widget> newRenderizedGrid = List.from(pathlessGrid);

      for (var cell in pathBeingRendered) {
        newRenderizedGrid[cell.row * widget.matrixSize.$2 + cell.column] =
            Container(color: Colors.blue);
      }
      renderizedGrid = newRenderizedGrid;
    });
  }

  _MapWidgetState((int, int) matrixSize, List<BoothWidget> boothsList,
      GridMap gridMapEntity) {
    aStarCalculator = AStarCalculator(gridMapEntity);
    renderizedGrid =
        List<Widget>.generate(matrixSize.$1 * matrixSize.$2, (int index) {
      return Container(
        color: Colors.white,
      );
    }, growable: false);

    for (var booth in boothsList) {
      for (int i = booth.superiorLeftPoint.$1;
          i <= booth.inferiorRightPoint.$1;
          i++) {
        for (int j = booth.superiorLeftPoint.$2;
            j <= booth.inferiorRightPoint.$2;
            j++) {
          booth.callbackFunction = CalculateAndRenderPath;
          renderizedGrid[i * matrixSize.$2 + j] = booth;

          pathlessGrid = List.from(renderizedGrid);
          gridMapEntity.setCellUnwalkableByPosition(i, j);
        }
      }
    }
  }
}
