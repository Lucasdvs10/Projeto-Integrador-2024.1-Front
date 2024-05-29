import 'package:flutter/material.dart';
import 'package:projeto_integrador/Entities/ProjectEntity.dart';
import 'package:projeto_integrador/Entities/StudentEntity.dart';
import 'package:projeto_integrador/PathFinding/AllBoothsMap.dart';
import 'package:projeto_integrador/Repositories/IProjectRepo.dart';
import 'package:projeto_integrador/Repositories/IStudentRepo.dart';
import 'package:projeto_integrador/Repositories/RepositoryInjector.dart';
import 'package:projeto_integrador/pages/mapa.dart';

import 'fourthpage.dart';
import 'main.dart';
import 'thirdpage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  final TextEditingController _searchController = TextEditingController();
  late final List<StudentEntity> _data;
  late final IStudentRepo _studentRepo;
  List<StudentEntity> _filteredData = [];
  StudentEntity? _selectedItem;

  @override
  void initState() {
    super.initState();
    Initialize();
  }

  void Initialize() async {
    _studentRepo = RepositoryInjector.GetStudentRepo();
    _data = await _studentRepo.GetAllStudents();
    _filteredData = _data;
  }

  void _filterData(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredData = _data
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredData = _data;
      }
    });
  }

  void _onItemTap(StudentEntity item) async {
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
    await Future.delayed(const Duration(milliseconds: 3000));

    // Fechar o diálogo de carregamento
    Navigator.of(context, rootNavigator: true).pop();

    // Navegar para a MapPage após fechar o diálogo de carregamento
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MapPage(
        startPoint: (56, 8),
        endPoint: AllBoothsMap.GetBoothByBoothNumber(item.boothNumber)!
            .entryBoothPoint,
      ),
    ));

    // Resetando o item selecionado
    setState(() {
      _selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/imt_logo.png',
              width: 150,
              height: 150,
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 100.0),
              child: Text(
                'EUREKA',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0A2E93),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Tela Inicial'),
              onTap: () {
                // Voltar à tela inicial quando a "Opção 1" é selecionada
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome do projeto'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome do orientador'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Mapa'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
            width: 600, // Largura do container
            height: 500, // Altura do container
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
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
                            'Aluno não encontrado! Verifique se o nome está escrito corretamente.',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          itemCount: _filteredData.length,
                          itemBuilder: (context, index) {
                            final StudentEntity item = _filteredData[index];
                            final bool isFound =
                                _searchController.text.isNotEmpty &&
                                    item.name.toLowerCase().contains(
                                        _searchController.text.toLowerCase());
                            return InkWell(
                              onTap: () => _onItemTap(item),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                color: item == _selectedItem
                                    ? Colors.lightBlueAccent
                                    : index.isOdd
                                        ? Colors.grey.shade200
                                        : Colors.white,
                                child: Text(
                                  item.name,
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
    );
  }
}
