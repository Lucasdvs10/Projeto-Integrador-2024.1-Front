import 'package:projeto_integrador/Repositories/Entities/AdvisorEntity.dart';
import 'package:projeto_integrador/Repositories/Entities/StudentEntity.dart';
import 'package:projeto_integrador/Repositories/IAdvisorRepo.dart';

class AdvisorRepoMock implements IAdvisorRepo {
  List<AdvisorEntity> advisorsList = [
    AdvisorEntity(
        id: 1,
        name: "Ana Paula",
        students: [StudentEntity(name: "Lucas", boothNumber: 3, id: 3)]),
    AdvisorEntity(
        id: 2,
        name: "Alex",
        students: [StudentEntity(name: "Tiago", boothNumber: 2, id: 2)]),
    AdvisorEntity(
        id: 3,
        name: "Rudolf",
        students: [StudentEntity(name: "Victor", boothNumber: 1, id: 1)]),
    AdvisorEntity(
        id: 4,
        name: "Andréia",
        students: [StudentEntity(name: "Marcos", boothNumber: 4, id: 4)]),
    AdvisorEntity(
        id: 5,
        name: "Bossini",
        students: [StudentEntity(name: "Débora", boothNumber: 5, id: 5)]),
  ];

  @override
  Future<AdvisorEntity?> GetAdvisorById(int id) {
    for (var advisor in advisorsList) {
      if(advisor.id == id) {
        return Future.value(advisor);
      }
    }
        return Future.value(null);
  }

  @override
  Future<AdvisorEntity?> GetAdvisorByName(String name) {
    for (var advisor in advisorsList) {
      if(advisor.name == name) {
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
