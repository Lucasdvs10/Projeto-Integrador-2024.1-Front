import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:projeto_integrador/Repositories/IStudentRepo.dart';

class StudentRepoBack implements IStudentRepo{
  StudentRepoBack(){}

  @override
  Future<List<StudentEntity>> GetAllStudents() {
    // TODO: implement GetAllStudents
    throw UnimplementedError();
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