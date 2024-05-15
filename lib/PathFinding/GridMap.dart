import 'CellEntity.dart';

class GridMap {
  late List<List<CellEntity>> _cellMatrix;

  GridMap(List<List<int>> matrix) {
    _cellMatrix = List<List<CellEntity>>.generate(
        matrix.length,
        (int i) => List<CellEntity>.generate(
            matrix[0].length, (int i) => CellEntity(0, 0, false),
            growable: false),
        growable: false);
    for (int i = 0; i < matrix.length; i++) {
      for (int j = 0; j < matrix[i].length; j++) {
        _cellMatrix[i][j] = new CellEntity(i, j, matrix[i][j] == 1);
      }
    }
  }

  GridMap.AllWalkable(int numRows, int numColumns) {
    _cellMatrix = List<List<CellEntity>>.generate(
        numRows,
        (int i) => List<CellEntity>.generate(
            numColumns, (int i) => CellEntity(0, 0, true),
            growable: false),
        growable: false);
    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numColumns; j++) {
        _cellMatrix[i][j] = CellEntity(i, j, true);
      }
    }
  }
  List<List<CellEntity>> getCellsMatrix() {
    return _cellMatrix;
  }
}
