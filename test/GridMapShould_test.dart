import 'package:projeto_integrador/PathFinding/GridMap.dart';
import 'package:test/test.dart';

void main(){
  test('All cells at middle Column must be unwalkable', () {
    List<List<int>> cellsMatrix = [
      [1,0,1],
      [1,0,1],
      [1,0,1],
    ];

    GridMap gridMap = GridMap(cellsMatrix);
    var matrix = gridMap.getCellsMatrix();
    
    expect(matrix[0][0].walkable, true);
    expect(matrix[1][0].walkable, true);
    expect(matrix[2][0].walkable, true);

    expect(matrix[0][1].walkable, false);
    expect(matrix[1][1].walkable, false);
    expect(matrix[2][1].walkable, false);

    expect(matrix[0][2].walkable, true);
    expect(matrix[1][2].walkable, true);
    expect(matrix[2][2].walkable, true);
    
  });
}