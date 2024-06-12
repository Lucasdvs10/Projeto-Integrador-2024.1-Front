import 'package:projeto_integrador/Entities/StudentEntity.dart';

class AdvisorEntity {
  late int id;
  late String name;
  late String projectName;
  late int boothNumber;

  AdvisorEntity(
      {required this.id, required this.name, required this.projectName, required this.boothNumber});
}
