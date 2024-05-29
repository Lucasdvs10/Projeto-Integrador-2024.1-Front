import 'package:projeto_integrador/Entities/StudentEntity.dart';

class AdvisorEntity {
  late int id;
  late String name;
  late List<StudentEntity> students;
  late String projectName;

  AdvisorEntity({required this.id, required this.name, required this.students, required this.projectName});
}
