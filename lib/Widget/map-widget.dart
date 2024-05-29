import 'package:flutter/material.dart';
import 'package:projeto_integrador/PathFinding/AStarCalculator.dart';
import 'package:projeto_integrador/PathFinding/AllBoothsMap.dart';
import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';

class MapWidget extends StatefulWidget {
  late final (int, int) matrixSize;
  late final List<BoothWidget> boothsList;
  late final GridMap gridMapEntity;
  Function((int, int), (int, int))? _calculatePathFunction;
  (int, int)? _startPoint;
  (int, int)? _endPoint;

  void CalculatePathAndRender((int, int) startPoint, (int, int) endPoint) {
    if (_calculatePathFunction == null) return;
    _calculatePathFunction!(startPoint, endPoint);
  }

  MapWidget({super.key, required this.matrixSize, required this.boothsList}) {
    gridMapEntity = GridMap.AllWalkable(matrixSize.$1, matrixSize.$2);
  }
  factory MapWidget.Eureka2023([(int, int)? startPoint, (int, int)? endPoint]) {
    var mapWidget = MapWidget(
        matrixSize: (59, 30), boothsList: AllBoothsMap.GetAllBoothsList());
    mapWidget._startPoint = startPoint;
    mapWidget._endPoint = endPoint;
    return mapWidget;
  }
  @override
  State<MapWidget> createState() => _MapWidgetState(
      matrixSize, boothsList, gridMapEntity, _startPoint, _endPoint);
}

class _MapWidgetState extends State<MapWidget> {
  late List<Widget> renderizedGrid;
  late List<Widget> pathlessGrid;
  late final AStarCalculator aStarCalculator;
  List<CellEntity> pathBeingRendered = [];

  @override
  Widget build(BuildContext context) {
    this.widget._calculatePathFunction = CalculateAndRenderPath;
    return GridView.count(crossAxisCount: 30, children: renderizedGrid);
  }

  void _PaintPathOnGrid((int, int) matrixSize) {
    for (var cell in pathBeingRendered) {
      renderizedGrid[cell.row * matrixSize.$2 + cell.column] =
          Container(color: Colors.black);
    }
  }

  void CalculateAndRenderPath((int, int) startPoint, (int, int) endPoint) {
    bool itsTheSamePathAgain = pathBeingRendered.isNotEmpty &&
        pathBeingRendered.last.getCoordinates() == endPoint &&
        pathBeingRendered.first.getCoordinates() == startPoint;

    if (itsTheSamePathAgain) return;

    CalculatePath(startPoint, endPoint);
    RenderPath();
  }

  void CalculatePath((int, int) startPoint, (int, int) endPoint) {
    pathBeingRendered =
        aStarCalculator.CalculatePathByCoordinates(startPoint, endPoint);
  }

  void RenderPath() {
    renderizedGrid = List.from(pathlessGrid);

    _PaintPathOnGrid(widget.matrixSize);

    setState(() {});
  }

  _MapWidgetState((int, int) matrixSize, List<BoothWidget> boothsList,
      GridMap gridMapEntity,
      [(int, int)? startPoint, (int, int)? endPoint]) {
    aStarCalculator = AStarCalculator(gridMapEntity);
    renderizedGrid =
        List<Widget>.generate(matrixSize.$1 * matrixSize.$2, (int index) {
      return Container(
        color: Colors.white,
      );
    }, growable: false);

    for (var booth in boothsList) {
      for (int i = booth.superiorLeftPoint.$1;
          i <= booth.superiorLeftPoint.$1 + booth.sizes.$1 - 1;
          i++) {
        for (int j = booth.superiorLeftPoint.$2;
            j <= booth.superiorLeftPoint.$2 + booth.sizes.$2 - 1;
            j++) {
          booth.callbackFunction = CalculateAndRenderPath;
          renderizedGrid[i * matrixSize.$2 + j] = booth;

          pathlessGrid = List.from(renderizedGrid);
          gridMapEntity.setCellUnwalkableByPosition(i, j);
        }
      }
    }
    if (startPoint != null && endPoint != null) {
      CalculatePath(startPoint, endPoint);
      _PaintPathOnGrid(matrixSize);
    }
  }
}
