import 'package:projeto_integrador/Repositories/Entities/StudentEntity.dart';

abstract class IStudentRepo {
  Future<StudentEntity?> GetStudentById(int id);
  Future<StudentEntity?> GetStudentByName(String name);
  Future<List<StudentEntity>> GetAllStudents();
}