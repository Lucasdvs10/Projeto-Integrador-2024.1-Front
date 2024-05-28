import 'package:projeto_integrador/Repositories/Entities/StudentEntity.dart';

class AdvisorEntity {
  late int id;
  late String name;
  late List<StudentEntity> students;

  AdvisorEntity({required this.id, required this.name, required this.students});
}
