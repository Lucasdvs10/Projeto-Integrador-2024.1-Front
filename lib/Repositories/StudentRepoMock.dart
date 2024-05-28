import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:projeto_integrador/Repositories/IStudentRepo.dart';

class StudentRepoMock implements IStudentRepo {
  List<StudentEntity> studentsList = [
    StudentEntity(id: 1, name: "Débora Witt", boothNumber: 1),
    StudentEntity(id: 2, name: "Tiago", boothNumber: 2),
    StudentEntity(id: 3, name: "Lucas Duez", boothNumber: 3),
    StudentEntity(id: 4, name: "Victor", boothNumber: 4),
    StudentEntity(id: 5, name: "Gabriel", boothNumber: 5),
  ];

  @override
  Future<List<StudentEntity>> GetAllStudents() {
    return Future.value(studentsList);
  }

  @override
  Future<StudentEntity?> GetStudentById(int id) {
    for (var student in studentsList) {
      if (student.id == id) {
        return Future.value(student);
      }
    }
    return Future.value(null);
  }

  @override
  Future<StudentEntity?> GetStudentByName(String name) {
    for (var student in studentsList) {
      if (student.name == name) {
        return Future.value(student);
      }
    }
    return Future.value(null);
  }
}
