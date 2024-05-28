import 'package:projeto_integrador/Repositories/Entities/ProjectEntity.dart';
import 'package:projeto_integrador/Repositories/IProjectRepo.dart';

class ProjectRepoMock implements IProjectRepo {
  List<ProjectEntity> projectsList = [
    ProjectEntity(id: 1, projectName: "Minerando Água na Lua", boothNumber: 1),
    ProjectEntity(
        id: 2,
        projectName: "Fusão Nuclear: A energia do futuro",
        boothNumber: 2),
    ProjectEntity(
        id: 3,
        projectName:
            "Um estudo sobre como jogos eletrônicos podem auxiliar no tratamento para ansiedade",
        boothNumber: 3),
    ProjectEntity(
        id: 4,
        projectName: "Uma pesquisa sobre o Paradoxo de Fermi",
        boothNumber: 4),
    ProjectEntity(
        id: 5, projectName: "A teoria da floresta negra", boothNumber: 5),
  ];

  @override
  Future<List<ProjectEntity>> GetAllProjects() {
    return Future.value(projectsList);
  }

  @override
  Future<ProjectEntity?> GetProjectById(int id) {
    for (var project in projectsList) {
      if (project.id == id) {
        return Future.value(project);
      }
    }
    return Future.value(null);
  }
}
