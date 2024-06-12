import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:projeto_integrador/Repositories/IStudentRepo.dart';

class StudentRepoBack implements IStudentRepo {
  Future<Map<String, dynamic>> MakeAGetRequestToAPI() {
    // Aqui terá a lógica de fazer a requisição pra API
    // Instanciar um json com a resposta e retorná-lo
    throw UnimplementedError();
  }

  @override
  Future<List<StudentEntity>> GetAllStudents() async {
    //O formato do json esperado é:
    /*
    {
      [
        {
         'idAluno': 1234,
         'nomeAluno': 'Lucas Duez',
         "trabalho":{
           "estande":{
             "numEstande": 15
            }
          }
        },
        {
          outro aluno...
        }
      ]
    }
    */

    var response = await MakeAGetRequestToAPI();
    var allStudentsJson = response['allStudents'];

    List<StudentEntity> listToReturn = [];

    for (var student in allStudentsJson) {
      listToReturn.add(StudentEntity.FromJson(student as Map<String, dynamic>));
    }

    return Future.value(listToReturn);
  }

  @override
  Future<StudentEntity?> GetStudentById(int id) {
    // TODO: implement GetStudentById
    throw UnimplementedError();
  }

  @override
  Future<StudentEntity?> GetStudentByName(String name) {
    // TODO: implement GetStudentByName
    throw UnimplementedError();
  }
}
