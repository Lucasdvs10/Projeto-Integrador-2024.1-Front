import 'package:projeto_integrador/Entities/AdvisorEntity.dart';
import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:projeto_integrador/Repositories/IAdvisorRepo.dart';

class AdvisorRepoMock implements IAdvisorRepo {
  List<AdvisorEntity> advisorsList = [
    AdvisorEntity(
        id: 1,
        name: "Ana Paula",
        projectName:
            "Um estudo sobre como jogos eletrônicos podem auxiliar no tratamento de ansiedade",
            boothNumber: 1
            ),
            
    AdvisorEntity(
      id: 2,
      name: "Alex",
      projectName: "Fusão Nuclear: A energia do futuro",
      boothNumber: 2
    ),
    AdvisorEntity(
        id: 3,
        name: "Rudolf",
        projectName: "Minerando Água na Lua",
        boothNumber: 3
        ),
    AdvisorEntity(
      id: 4,
      name: "Andréia",
      projectName: "Uma pesquisa sobre o Paradoxo de Fermi",
      boothNumber: 4
    ),
    AdvisorEntity(
        id: 5,
        name: "Bossini",
        projectName: "A teoria da floresta negra",
        boothNumber: 5
        ),
  ];

  @override
  Future<AdvisorEntity?> GetAdvisorById(int id) {
    for (var advisor in advisorsList) {
      if (advisor.id == id) {
        return Future.value(advisor);
      }
    }
    return Future.value(null);
  }

  @override
  Future<AdvisorEntity?> GetAdvisorByName(String name) {
    for (var advisor in advisorsList) {
      if (advisor.name == name) {
        return Future.value(advisor);
      }
    }
    return Future.value(null);
  }

  @override
  Future<List<AdvisorEntity>> GetAllAdvisors() {
    return Future.value(advisorsList);
  }
}
