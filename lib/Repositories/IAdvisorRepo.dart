import 'package:projeto_integrador/Repositories/Entities/AdvisorEntity.dart';

abstract class IAdvisorRepo {
  Future<List<AdvisorEntity>> GetAllAdvisors();
  Future<AdvisorEntity?> GetAdvisorById(int id);
  Future<AdvisorEntity?> GetAdvisorByName(String name);
}