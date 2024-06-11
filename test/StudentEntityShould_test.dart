import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:test/test.dart';

void main() {
  test('Instantiate from json', () {
    Map<String, dynamic> json = {
      'id_aluno': 1234,
      'nome_aluno': 'Lucas Duez',
      'ra_aluno': 213332323,
      'cur_aluno': 'Cur'
    };

    StudentEntity studentEntity = StudentEntity.FromJson(json);

    expect(studentEntity.name, 'Lucas Duez');
    expect(studentEntity.id, 1234);
  });
}
