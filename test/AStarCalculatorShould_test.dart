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
    expect(path.length, 3);
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
    expect(path.length, 3);
  });

  test('Return the shortest path when there are more than one path avaible',
      () {
    GridMap gridMap = GridMap([
      [1, 1, 1],
      [1, 1, 1],
      [1, 1, 1]
    ]);

    AStarCalculator aStarCalculator = AStarCalculator(gridMap);

    CellEntity startCell = gridMap.getCellsMatrix()[1][0];
    CellEntity targetCell = gridMap.getCellsMatrix()[1][2];

    List<CellEntity> path =
        aStarCalculator.CalculatePath(startCell, targetCell);

    expect(path[0], CellEntity(1, 0, true));
    expect(path[1], CellEntity(1, 1, true));
    expect(path[2], CellEntity(1, 2, true));
    expect(path.length, 3);
  });

test('Return the shortest path when there are more than one path avaible even in a 10x10 Matrix',
      () {
    GridMap gridMap = GridMap([
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ]);

    AStarCalculator aStarCalculator = AStarCalculator(gridMap);

    CellEntity startCell = gridMap.getCellsMatrix()[0][0];
    CellEntity targetCell = gridMap.getCellsMatrix()[9][9];

    List<CellEntity> path =
        aStarCalculator.CalculatePath(startCell, targetCell);

    expect(path[0], CellEntity(0, 0, true)); //O menor caminho é a diagonal principal
    expect(path[1], CellEntity(1, 1, true));
    expect(path[2], CellEntity(2, 2, true));
    expect(path[3], CellEntity(3, 3, true));
    expect(path[4], CellEntity(4, 4, true));
    expect(path[5], CellEntity(5, 5, true));
    expect(path[6], CellEntity(6, 6, true));
    expect(path[7], CellEntity(7, 7, true));
    expect(path[8], CellEntity(8, 8, true));
    expect(path[9], CellEntity(9, 9, true));
    expect(path.length, 10);
  });
}
