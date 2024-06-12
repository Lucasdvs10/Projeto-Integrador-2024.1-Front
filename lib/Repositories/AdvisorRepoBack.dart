import 'dart:convert';

import 'package:projeto_integrador/Entities/AdvisorEntity.dart';
import 'package:projeto_integrador/Repositories/IAdvisorRepo.dart';

import 'package:http/http.dart' as http;
class AdvisorRepoBack implements IAdvisorRepo {
  /*
    Devido ao jeito que o banco de dados foi modelado,
    para pegar todos os orientadores e os projetos orientados, estamos
    dando um getAllProjects
  */
  Future<List<Map<String, dynamic>>> RequestAllProjectsToAPI() async {
    // Aqui terá a lógica de fazer a requisição pra API
    // Instanciar um json com a resposta e retorná-lo
    var response = await http
        .get(Uri.parse('http://192.168.100.157:8080/trabalho/getAllTrabalhos'));
    var utf8Decoder = utf8.decode(response.bodyBytes);
    return (jsonDecode(utf8Decoder) as List).cast<Map<String, dynamic>>();
  }

  @override
  Future<AdvisorEntity?> GetAdvisorById(int id) {
    // TODO: implement GetAdvisorById
    throw UnimplementedError();
  }

  @override
  Future<AdvisorEntity?> GetAdvisorByName(String name) {
    // TODO: implement GetAdvisorByName
    throw UnimplementedError();
  }

  @override
  Future<List<AdvisorEntity>> GetAllAdvisors() async {
    var allProjectsJsonList = await RequestAllProjectsToAPI();

    List<AdvisorEntity> listToReturn = [];

    for (var project in allProjectsJsonList) {
      listToReturn.add(AdvisorEntity.FromProjectJson(project));
    }

    return Future.value(listToReturn);
  }
  
}