import 'dart:convert';

import 'package:projeto_integrador/Entities/ProjectEntity.dart';
import 'package:test/test.dart';

void main() {
  test('Instantiate from json', () {
    Map<String, dynamic> json = {
      'idTrabalho': 1234,
      'tituloTrabalho': "Minerando água na lua",
      "estande": {"numEstande": 15}
    };

    ProjectEntity projectEntity = ProjectEntity.FromJson(json);

    expect(projectEntity.projectName, "Minerando água na lua");
    expect(projectEntity.id, 1234);
    expect(projectEntity.boothNumber, 15);
  });

  test('Instantiate from json using Json Decoder', () {
    var json = jsonDecode(
        '{"idTrabalho" :1234,"tituloTrabalho":"Minerando água na lua","estande": {"numEstande": 15}}');

    ProjectEntity projectEntity = ProjectEntity.FromJson(json);

    expect(projectEntity.projectName, "Minerando água na lua");
    expect(projectEntity.id, 1234);
    expect(projectEntity.boothNumber, 15);
  });

  test('Instantiate from an array of jsons', () {
    var json = jsonDecode(
        '[{"idTrabalho" :1234,"tituloTrabalho":"Minerando água na lua","estande": {"numEstande": 15}}, {"idTrabalho" :123,"tituloTrabalho":"Minerando água na lua","estande": {"numEstande": 15}}]');

    ProjectEntity projectEntity = ProjectEntity.FromJson(json[0]);

    expect(projectEntity.projectName, "Minerando água na lua");
    expect(projectEntity.id, 1234);
    expect(projectEntity.boothNumber, 15);
  });
}
