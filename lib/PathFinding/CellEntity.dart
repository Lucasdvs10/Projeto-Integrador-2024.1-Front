class CellEntity {
  late int row;
  late int column;
  late bool walkable;

  late int _gCost;
  late int _hCost;
  late int _fCost;

  CellEntity(this.row, this.column, this.walkable);

  void setGAndHCosts(CellEntity startCell, CellEntity targetCell) {
    //Por questões de performance, eu não estou tirando a raiz do teorema de pitagoras

    _gCost = (startCell.row - row) * (startCell.row - row) +
        (startCell.column - column) * (startCell.column - column);

    _hCost = (targetCell.row - row) * (targetCell.row - row) +
        (targetCell.column - column) * (targetCell.column - column);

    _fCost = _hCost + _gCost;
  }

  int getFCost() {
    return _fCost;
  }
}
