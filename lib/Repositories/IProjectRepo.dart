import 'package:projeto_integrador/Repositories/Entities/ProjectEntity.dart';

abstract class IProjectRepo {
  Future<ProjectEntity?> GetProjectById(int id);
  Future<List<ProjectEntity>> GetAllProjects();
}