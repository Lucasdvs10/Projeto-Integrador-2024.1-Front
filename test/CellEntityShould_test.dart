import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:test/test.dart';

void main() {
  test('Set Cell Entity rows and columns with value 1 and walkable true', () {
    CellEntity cellEntity = CellEntity(1, 1, true);
    expect(cellEntity.row, 1);
    expect(cellEntity.column, 1);
    expect(cellEntity.walkable, true);
  });

  test(
      'Set fCost with value 10 when targetCell is 3 positions away from currentCell and startCell is 1 position away from currentCell',
      () {
    CellEntity currentCell = CellEntity(1, 1, true);
    CellEntity startCell = CellEntity(1, 0, true);
    CellEntity targetCell = CellEntity(1, 2, true);

    startCell.setGAndHCosts(startCell, targetCell, true);
    currentCell.setPreviousCellAndCalculateFCost(
        startCell, startCell, targetCell);

    expect(currentCell.getFCost(), 2);
  });

  test('Reset all values', () {
    CellEntity currentCell = CellEntity(1, 1, true);
    CellEntity startCell = CellEntity(1, 0, true);
    CellEntity targetCell = CellEntity(1, 2, true);

    currentCell.setPreviousCellAndCalculateFCost(
        startCell, startCell, targetCell);

    currentCell.Reset();
    expect(currentCell.getFCost(), 0);
    expect(currentCell.GetGCost(), 10000);
    expect(currentCell.GetHCost(), 0);
  });
}
