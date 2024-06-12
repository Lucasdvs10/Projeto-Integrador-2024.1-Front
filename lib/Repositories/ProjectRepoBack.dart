import 'dart:convert';

import 'package:projeto_integrador/Entities/ProjectEntity.dart';
import 'package:projeto_integrador/Repositories/IProjectRepo.dart';

import 'package:http/http.dart' as http;

class ProjectRepoBack implements IProjectRepo {
  Future<List<Map<String, dynamic>>> RequestAllProjectsToAPI() async {
    // Aqui terá a lógica de fazer a requisição pra API
    // Instanciar um json com a resposta e retorná-lo
    var response = await http
        .get(Uri.parse('http://192.168.100.157:8080/trabalho/getAllTrabalhos'));
    var utf8Decoder = utf8.decode(response.bodyBytes);
    return (jsonDecode(utf8Decoder) as List).cast<Map<String, dynamic>>();
  }

  @override
  Future<List<ProjectEntity>> GetAllProjects() async {
    var allProjectsJsonList = await RequestAllProjectsToAPI();

    List<ProjectEntity> listToReturn = [];

    for (var project in allProjectsJsonList) {
      listToReturn.add(ProjectEntity.FromJson(project));
    }

    return Future.value(listToReturn);
  }

  @override
  Future<ProjectEntity?> GetProjectById(int id) {
    // TODO: implement GetProjectById
    throw UnimplementedError();
  }
}
