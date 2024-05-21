import 'CellEntity.dart';

class GridMap {
  late List<List<CellEntity>> _cellMatrix;

  GridMap(List<List<int>> matrix) {
    _cellMatrix = List<List<CellEntity>>.generate(
        matrix.length,
        (int i) => List<CellEntity>.generate(
            matrix[0].length, (int j) => CellEntity(i, j, matrix[i][j] == 1),
            growable: false),
        growable: false);
  }

  GridMap.AllWalkable(int numRows, int numColumns) {
    _cellMatrix = List<List<CellEntity>>.generate(
        numRows,
        (int i) => List<CellEntity>.generate(
            numColumns, (int j) => CellEntity(i, j, true),
            growable: false),
        growable: false);
  }

  void setCellUnwalkableByPosition(int row, int column) {
    _cellMatrix[row][column].walkable = false;
  }

  List<List<CellEntity>> getCellsMatrix() {
    return _cellMatrix;
  }
}
