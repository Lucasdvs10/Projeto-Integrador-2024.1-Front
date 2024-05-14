import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';

class AStarCalculator {
  late GridMap _gridMap;

  List<CellEntity> CalculatePath(CellEntity startCell, CellEntity targetCell) {
    startCell.setGAndHCosts(startCell, targetCell);

    Set<CellEntity> openSet = {startCell};
    Set<CellEntity> closedSet = {};

    CellEntity currentCell = _GetCheapestCell(openSet);

    while (openSet.isNotEmpty) {
      currentCell = _GetCheapestCell(openSet);

      if (!currentCell.walkable) continue;

      if (currentCell.row == targetCell.row &&
          currentCell.column == targetCell.column) break;

      openSet.remove(currentCell);
      closedSet.add(currentCell);
      _CalculateFCostForCurrentNeighbors(currentCell, startCell, targetCell);

      Set<CellEntity> neighborsSet = _GetNeighborsSet(currentCell);
      for (var neighbor in neighborsSet) {
        if (!neighbor.walkable || closedSet.contains(neighbor)) continue;

        neighbor.setPreviousCellAndCalculateFCost(
            currentCell, startCell, targetCell);

        if (!openSet.contains(neighbor)) {
          neighbor.setPreviousCellAndCalculateFCost(
              currentCell, startCell, targetCell);
          openSet.add(neighbor);
        } else {
          int oldFCost = neighbor.getFCost();
          CellEntity oldPrevious = neighbor.getPreviousCell()!;

          neighbor.setPreviousCellAndCalculateFCost(
              currentCell, startCell, targetCell);

          if (neighbor.getFCost() > oldFCost) {
            neighbor.setPreviousCellAndCalculateFCost(
                oldPrevious, startCell, targetCell);
          }
        }
      }
    }

    List<CellEntity> path = [];

    while (currentCell != startCell) {
      path.insert(0, currentCell);
      currentCell = currentCell.getPreviousCell()!;
    }

    path.insert(0, startCell);

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
      cellsMatrix[previousRow][nextColumn],
      cellsMatrix[currentRow][nextColumn],
      cellsMatrix[nextRow][nextColumn],
      cellsMatrix[nextRow][currentColumn],
      cellsMatrix[nextRow][previousColumn],
      cellsMatrix[currentRow][previousColumn],
      cellsMatrix[previousRow][previousColumn],
    };

    return neighborsSet;
  }

  void _CalculateFCostForCurrentNeighbors(
      CellEntity currentCell, CellEntity startCell, CellEntity targetCell) {
    var neighborsSet = _GetNeighborsSet(currentCell);

    for (var cell in neighborsSet) {
      cell.setGAndHCosts(startCell, targetCell);
    }
  }

  CellEntity _GetCheapestCell(Set<CellEntity> cellsSet) {
    CellEntity cheapestCell = cellsSet.first;

    for (var cell in cellsSet) {
      if (cell.GetHCost() <= 0) return cell;

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
