import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';
import 'thirdpage.dart';
class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _data = [
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Text(
                'EUREKA',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
              title: Text('Tela Inicial'),
              onTap: () {
                // Voltar à tela inicial quando a "Opção 1" é selecionada
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Pesquisa por nome do aluno'),
              onTap: () {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
              },
            ),
            ListTile(
              title: Text('Pesquisa por nome de projeto'),
              onTap: () {Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ThirdPage()),
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
              boxShadow: [
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
                    decoration: InputDecoration(
                      hintText: 'Pesquisar...',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: _filteredData.isEmpty
                      ? Center(
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
