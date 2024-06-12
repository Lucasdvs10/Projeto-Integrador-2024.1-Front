import 'dart:convert';

import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:test/test.dart';

void main() {
  test('Instantiate from json', () {
    Map<String, dynamic> json = {
      'idAluno': 1234,
      'nomeAluno': 'Lucas Duez',
      "trabalho": {
        "estande": {"numEstande": 15}
      }
    };

    StudentEntity studentEntity = StudentEntity.FromJson(json);

    expect(studentEntity.name, 'Lucas Duez');
    expect(studentEntity.id, 1234);
    expect(studentEntity.boothNumber, 15);
  });

  test('Instantiate from json using Json Decoder', () {
    var json = jsonDecode(
        '{"idAluno": 1234,"nomeAluno": "Lucas Duez","trabalho": {"estande"  : {"numEstande": 15}}}');

    StudentEntity studentEntity = StudentEntity.FromJson(json);

    expect(studentEntity.name, 'Lucas Duez');
    expect(studentEntity.id, 1234);
    expect(studentEntity.boothNumber, 15);
  });

  test('Instantiate from an array of jsons', () {
    var json = jsonDecode(
        '[{"idAluno": 1234,"nomeAluno": "Lucas Duez","trabalho": {"estande"  : {"numEstande": 15}}}, {"idAluno": 1234,"nomeAluno": "Lucas Duez","trabalho": {"estande"  : {"numEstande": 15}}}]');

    StudentEntity studentEntity = StudentEntity.FromJson(json[0]);

    expect(studentEntity.name, 'Lucas Duez');
    expect(studentEntity.id, 1234);
    expect(studentEntity.boothNumber, 15);
  });
}
