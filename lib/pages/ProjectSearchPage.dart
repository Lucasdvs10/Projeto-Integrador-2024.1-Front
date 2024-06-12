import 'package:flutter/material.dart';
import 'package:projeto_integrador/Entities/ProjectEntity.dart';
import 'package:projeto_integrador/PathFinding/AllBoothsMap.dart';
import 'package:projeto_integrador/Repositories/IProjectRepo.dart';
import 'package:projeto_integrador/Repositories/RepositoryInjector.dart';
import 'package:projeto_integrador/Widget/booth-widget.dart';
import 'AdvisorSearchPage.dart';
import 'StudentSearchPage.dart';
import 'SearchOptionsPage.dart';
import 'MapPage.dart';

class ProjectSearchPage extends StatefulWidget {
  const ProjectSearchPage({Key? key}) : super(key: key);

  @override
  ProjectSearchPageState createState() => ProjectSearchPageState();
}

class ProjectSearchPageState extends State<ProjectSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  late final List<ProjectEntity> _data;
  late final IProjectRepo _projectRepo;
  List<ProjectEntity> _filteredData = [];
  ProjectEntity? _selectedItem;

  @override
  void initState() {
    super.initState();
    Initialize();
  }

  void Initialize() async {
    _projectRepo = RepositoryInjector.GetProjectRepo();
    _data = await _projectRepo.GetAllProjects();
    _filteredData = _data;
    setState(() {});
  }

  void _filterData(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredData = _data
            .where((element) =>
                element.projectName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredData = _data;
      }
    });
  }

  void _onItemTap(ProjectEntity item) async {
    setState(() {
      _selectedItem = item;
    });

    print('Item clicked: $item');

    // Exibindo o diálogo de carregamento
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Adicionando uma pequena pausa antes de fechar o diálogo de carregamento
    await Future.delayed(const Duration(milliseconds: 30));

    // Fechar o diálogo de carregamento
    Navigator.of(context, rootNavigator: true).pop();

    BoothWidget targetBooth =
        AllBoothsMap.GetBoothByBoothNumber(item.boothNumber)!;

    Navigator.pop(context);
    Navigator.pop(context, ((56, 8), targetBooth.entryBoothPoint));

    // Resetando o item selecionado
    setState(() {
      _selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2E93),
        centerTitle: true, // Centraliza o título
        title: Text(
          'EUREKA',
          style: TextStyle(
            fontFamily: 'Dongle',
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor da seta de voltar como branca
        ),
      ),
      body: Stack(
        children: [
      // Imagem de fundo dimensionada
      Positioned.fill(
      child: Image.asset(
        "assets/images/eureka4.jpg",
        fit: BoxFit.cover,
      ),
    ),
    // Conteúdo principal
    Center(
    child: Padding(
    padding: const EdgeInsets.all(16.0), // Adiciona espaçamento ao redor do container
    child: Container(
    width: 600, // Largura do container
    height: 500, // Altura do container
    decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.9), // Transparência do fundo do container
    borderRadius: BorderRadius.circular(20), // Define o border radius
    boxShadow: const [
    BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    offset: Offset(0, 5),
    ),
    ],
    ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterData,
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar...',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: _filteredData.isEmpty
                      ? const Center(
                          child: Text(
                            'Projeto não encontrado! Verifique se o mesmo está escrito corretamente.',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          itemCount: _filteredData.length,
                          itemBuilder: (context, index) {
                            final ProjectEntity item = _filteredData[index];
                            final bool isFound =
                                _searchController.text.isNotEmpty &&
                                    item.projectName.toLowerCase().contains(
                                        _searchController.text.toLowerCase());
                            return InkWell(
                              onTap: () => _onItemTap(item),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                color: item == _selectedItem
                                    ? Colors.lightBlueAccent
                                    : index.isOdd
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                                child: Text(
                                  item.projectName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: isFound
                                          ? Colors.green
                                          : Colors.black),
                                ),
                              ),
                            );
                          },
                  ),
                ),
              ],
            ),
    ),
    ),
    ),
        ],
      ),
    );
  }
}