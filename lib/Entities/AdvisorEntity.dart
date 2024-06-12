import 'package:projeto_integrador/Entities/StudentEntity.dart';

class AdvisorEntity {
  late int id;
  late String name;
  late String projectName;
  late int boothNumber;

  AdvisorEntity(
      {required this.id, required this.name, required this.projectName, required this.boothNumber});

  factory AdvisorEntity.FromProjectJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'idTrabalho' : int idTrabalho,
        'tituloTrabalho': String tituloTrabalho,
          "estande": {
            "numEstande": int numEstande
        },
        "orientador":{
          "nomeOrientador": String nomeOrientador,
          "idOrientador": int idOrientador
        }
      } =>
        AdvisorEntity(id: idOrientador, name: nomeOrientador, projectName: tituloTrabalho, boothNumber: numEstande
        ),
      _ => throw const FormatException('Failed to load Project Entity.'),
    };
  }
}
