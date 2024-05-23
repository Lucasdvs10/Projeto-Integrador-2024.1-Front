import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'main.dart';
import 'thirdpage.dart';
class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  FourthPageState createState() => FourthPageState();
}

class FourthPageState extends State<FourthPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _data = [
    ' Orientador Teste',
    'Dados 2',
    'Dados 3',
    'Dados 4',
    'Dados 5',
    'Dados 6',
    'Dados 7',
    'Dados 8',
    'Dados 9',
    ' Gabriel Garcia (Finance) \n--------------------------------------------------------------------------------------------\n Fazendo dinheiro pra caralho com atividades ilegítimas \n + scam workshop \n--------------------------------------------------------------------------------------------\n Estande 420'
  ];

  List<String> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
  }

  void _filterData(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredData = _data.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        _filteredData = _data;
      }
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome do aluno'),
              onTap: () {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome de projeto'),
              onTap: () {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ThirdPage()),
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
                      'Orientador não encontrado! Verifique se o nome está escrito corretamente.',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                      : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    itemCount: _filteredData.length,
                    itemBuilder: (context, index) {
                      final String item = _filteredData[index];
                      final bool isFound = _searchController.text.isNotEmpty &&
                          item.toLowerCase().contains(_searchController.text.toLowerCase());
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        color: index.isOdd ? Colors.grey.shade200 : Colors.white,
                        child: Text(
                          item,
                          style: TextStyle(fontSize: 20, color: isFound ? Colors.green : Colors.black),
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