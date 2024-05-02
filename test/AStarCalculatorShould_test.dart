import 'package:projeto_integrador/PathFinding/AStarCalculator.dart';
import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:projeto_integrador/PathFinding/GridMap.dart';
import 'package:test/test.dart';

void main() {
  test('Return a list with cells at (1,0), (1,1), (1,2)', () {
    GridMap gridMap = GridMap([
      [0, 0, 0],
      [1, 1, 1],
      [0, 0, 0]
    ]);

    AStarCalculator aStarCalculator = AStarCalculator(gridMap);

    CellEntity startCell = gridMap.getCellsMatrix()[1][0];
    CellEntity targetCell = gridMap.getCellsMatrix()[1][2];

    List<CellEntity> path =
        aStarCalculator.CalculatePath(startCell, targetCell);

    expect(path[0], CellEntity(1, 0, true));
    expect(path[1], CellEntity(1, 1, true));
    expect(path[2], CellEntity(1, 2, true));
  });


  test('Return a list with cells at (1,0), (0,1), (1,2)', () {
    GridMap gridMap = GridMap([
      [0, 1, 0],
      [1, 0, 1],
      [0, 0, 0]
    ]);

    AStarCalculator aStarCalculator = AStarCalculator(gridMap);

    CellEntity startCell = gridMap.getCellsMatrix()[1][0];
    CellEntity targetCell = gridMap.getCellsMatrix()[1][2];

    List<CellEntity> path =
        aStarCalculator.CalculatePath(startCell, targetCell);

    expect(path[0], CellEntity(1, 0, true));
    expect(path[1], CellEntity(0, 1, true));
    expect(path[2], CellEntity(1, 2, true));
  });
}
