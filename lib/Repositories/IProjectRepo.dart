import 'package:projeto_integrador/Entities/ProjectEntity.dart';

abstract class IProjectRepo {
  Future<ProjectEntity?> GetProjectById(int id);
  Future<List<ProjectEntity>> GetAllProjects();
}