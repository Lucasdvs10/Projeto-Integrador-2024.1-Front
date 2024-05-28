import 'package:projeto_integrador/Repositories/Entities/ProjectEntity.dart';

abstract class IProjectRepo {
  ProjectEntity? GetProjectById(int id);
  List<ProjectEntity> GetAllProjects();
}