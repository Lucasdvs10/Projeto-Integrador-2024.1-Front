class ProjectEntity {
  late int id;
  late String projectName;
  late int boothNumber;

  ProjectEntity({required this.projectName, required this.boothNumber, required this.id});

  factory ProjectEntity.FromJson(Map<String, dynamic> json){
    return switch (json) {
      {
        'idTrabalho' : int idTrabalho,
        'tituloTrabalho': String tituloTrabalho,
          "estande": {
            "numEstande": int numEstande
        }
      } =>
        ProjectEntity(id: idTrabalho, projectName: tituloTrabalho, boothNumber: numEstande
        ),
      _ => throw const FormatException('Failed to load Project Entity.'),
    };
  }
}
