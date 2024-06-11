class StudentEntity {
  late String name;
  late int boothNumber;
  late int id;

  StudentEntity({required this.name, required this.boothNumber, required this.id});

  factory StudentEntity.FromJson(Map<String, dynamic> json){
    return switch (json) {
      {
        'id_aluno' : int idAluno,
        'nome_aluno': String nomeAluno,
        'ra_aluno': int raAluno,
        'cur_aluno': String curAluno
      } =>
        StudentEntity(name: nomeAluno, boothNumber: 1, id: idAluno

        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
