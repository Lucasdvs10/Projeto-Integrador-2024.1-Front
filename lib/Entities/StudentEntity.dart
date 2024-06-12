class StudentEntity {
  late String name;
  late int boothNumber;
  late int id;

  StudentEntity({required this.name, required this.boothNumber, required this.id});

  factory StudentEntity.FromJson(Map<String, dynamic> json){
    return switch (json) {
      {
        'idAluno' : int idAluno,
        'nomeAluno': String nomeAluno,
        "trabalho":{
          "estande": {
            "numEstande": int numEstande
          }
        }
      } =>
        StudentEntity(name: nomeAluno, boothNumber: numEstande, id: idAluno

        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
