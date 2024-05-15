class CellEntity {
  late int row;
  late int column;
  late bool walkable;

  int _gCost = 0;
  int _hCost = 0;
  int _fCost = 0;
  late CellEntity? _previousCell = null;

  CellEntity(this.row, this.column, this.walkable);

  CellEntity.WithValues(this.row, this.column, this.walkable, this._hCost,
      this._gCost, this._fCost, this._previousCell);

  void setPreviousCellAndCalculateFCost(
      CellEntity previousCell, CellEntity startCell, CellEntity targetCell) {
    _previousCell = previousCell;
    setGAndHCosts(startCell, targetCell);
  }

  void setGAndHCosts(CellEntity startCell, CellEntity targetCell) {
    //Por questões de performance, eu não estou tirando a raiz do teorema de pitagoras

    if (_previousCell != null) {
      _gCost = _previousCell!.GetGCost() +
          (_previousCell!.row - row) * (_previousCell!.row - row) +
          (_previousCell!.column - column) * (_previousCell!.column - column);
    } else {
      _gCost = 0;
    }

    _hCost = (targetCell.row - row) * (targetCell.row - row) +
        (targetCell.column - column) * (targetCell.column - column);

    _fCost = _hCost + _gCost;
  }

  int GetGCost() => _gCost;
  int GetHCost() => _hCost;

  @override
  String toString() {
    // TODO: implement toString
    return "Cell(row: $row, column: $column, walkable: $walkable)";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CellEntity &&
        other.row == row &&
        other.column == column &&
        other.walkable == walkable;
  }

  void setPreviousCell(CellEntity previousCell) => _previousCell = previousCell;
  CellEntity? getPreviousCell() => _previousCell;

  int getFCost() => _fCost;
}
