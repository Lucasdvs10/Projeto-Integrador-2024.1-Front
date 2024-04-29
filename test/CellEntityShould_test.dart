import 'package:projeto_integrador/PathFinding/CellEntity.dart';
import 'package:test/test.dart';

void main() {
  test('Cell Entity rows and columns must be 1 and walkable true', () {
    CellEntity cellEntity = CellEntity(1, 1, true);
    expect(cellEntity.row, 1);
    expect(cellEntity.column, 1);
    expect(cellEntity.walkable, true);
  });

  test('fCost must be 10', () {
    CellEntity currentCell = CellEntity(1, 1, true);
    CellEntity startCell = CellEntity(1, 0, true);
    CellEntity targetCell = CellEntity(1, 4, true);

    currentCell.setGAndHCosts(startCell, targetCell);

    expect(currentCell.getFCost(), 10);
  });
}
