import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';

class AStarCalculator {
  late GridMap _gridMap;

  List<CellEntity> CalculatePathByCoordinates(
      (int, int) startPoint, (int, int) endPoint) {
    CellEntity startCell =
        _gridMap.getCellsMatrix()[startPoint.$1][startPoint.$2];
    CellEntity endCell = _gridMap.getCellsMatrix()[endPoint.$1][endPoint.$2];

    return CalculatePath(startCell, endCell);
  }

  List<CellEntity> CalculatePath(CellEntity startCell, CellEntity targetCell) {
    Set<CellEntity> openSet = {startCell};
    Set<CellEntity> closedSet = {};
    startCell.setGAndHCosts(startCell, targetCell, true);
    CellEntity currentCell = startCell;

    while (openSet.isNotEmpty) {
      currentCell = _GetCheapestCell(openSet);

      if (currentCell == targetCell) {
        break;
      }
      openSet.remove(currentCell);
      closedSet.add(currentCell);

      var neighborsSet = _GetNeighborsSet(currentCell);
      for (CellEntity neighbor in neighborsSet) {
        if (!neighbor.walkable || closedSet.contains(neighbor)) continue;
        int oldGCost = neighbor.GetGCost();
        CellEntity previousParent = neighbor.getPreviousCell() ?? currentCell;
        neighbor.setPreviousCellAndCalculateFCost(
            currentCell, startCell, targetCell);

        if (oldGCost > neighbor.GetGCost()) {
          openSet.add(neighbor);
        } else {
          neighbor.setPreviousCellAndCalculateFCost(
              previousParent, startCell, targetCell);
        }
      }
    }

    List<CellEntity> path = [];
    while (currentCell != startCell) {
      path.insert(0, currentCell);
      currentCell = currentCell.getPreviousCell()!;
    }

    path.insert(0, startCell);

    for (var i = 0; i < _gridMap.getCellsMatrix().length; i++) { //Resetar os valores de cada célula após calcular o caminho
      for (var j = 0; j < _gridMap.getCellsMatrix()[i].length; j++) { //Se não fizermos isso, o próximo cálculo será afetado
        _gridMap.getCellsMatrix()[i][j].Reset();
      }
    }

    return path;
  }

  Set<CellEntity> _GetNeighborsSet(CellEntity cell) {
    var cellsMatrix = _gridMap.getCellsMatrix();
    int currentRow = cell.row;
    int currentColumn = cell.column;

    int previousRow = currentRow - 1 >= 0 ? currentRow - 1 : 0;
    int nextRow =
        currentRow + 1 < cellsMatrix.length ? currentRow + 1 : currentRow;

    int previousColumn = currentColumn - 1 >= 0 ? currentColumn - 1 : 0;
    int nextColumn = currentColumn + 1 < cellsMatrix[0].length
        ? currentColumn + 1
        : currentColumn;

    Set<CellEntity> neighborsSet = {
      cellsMatrix[previousRow][currentColumn],
      cellsMatrix[currentRow][nextColumn],
      cellsMatrix[nextRow][currentColumn],
      cellsMatrix[currentRow][previousColumn],
    };

    return neighborsSet;
  }

  CellEntity _GetCheapestCell(Set<CellEntity> cellsSet) {
    CellEntity cheapestCell = cellsSet.first;

    for (var cell in cellsSet) {
      if (!cell.walkable) continue;
      if (cell.GetHCost() <= 0) return cell; //It's the target cell

      if (cell.getFCost() < cheapestCell.getFCost()) {
        cheapestCell = cell;
      }
    }
    return cheapestCell;
  }

  AStarCalculator(this._gridMap);

  GridMap get gridMap => _gridMap;
  void set gridMap(GridMap gridMap) => _gridMap = gridMap;
}
