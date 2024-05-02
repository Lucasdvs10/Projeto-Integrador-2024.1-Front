import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';

class AStarCalculator {
  late GridMap _gridMap;



  AStarCalculator(this._gridMap);

  GridMap get gridMap => _gridMap;
  void set gridMap(GridMap gridMap) => _gridMap = gridMap;
}
