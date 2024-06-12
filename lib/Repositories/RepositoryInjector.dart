import 'package:projeto_integrador/Repositories/AdivsorRepoMock.dart';
import 'package:projeto_integrador/Repositories/AdvisorRepoBack.dart';
import 'package:projeto_integrador/Repositories/IAdvisorRepo.dart';
import 'package:projeto_integrador/Repositories/IProjectRepo.dart';
import 'package:projeto_integrador/Repositories/IStudentRepo.dart';
import 'package:projeto_integrador/Repositories/ProjectRepoBack.dart';
import 'package:projeto_integrador/Repositories/ProjectRepoMock.dart';
import 'package:projeto_integrador/Repositories/StudentRepoBack.dart';
import 'package:projeto_integrador/Repositories/StudentRepoMock.dart';

class RepositoryInjector {
  static const bool IS_TEST_ENVIROMENT = false;

  static IProjectRepo GetProjectRepo() {
    if (IS_TEST_ENVIROMENT) {
      return ProjectRepoMock();
    } else {
      return ProjectRepoBack();
    }
  }

  static IStudentRepo GetStudentRepo() {
    if (IS_TEST_ENVIROMENT) {
      return StudentRepoMock();
    } else {
      return StudentRepoBack();
    }
  }

  static IAdvisorRepo GetAdvisorRepo() {
    if (IS_TEST_ENVIROMENT) {
      return AdvisorRepoMock();
    } else {
      return AdvisorRepoBack();
    }
  }

}
