import 'package:flutter/material.dart';
import 'package:projeto_integrador/Widget/map-widget.dart';

import 'fourthpage.dart';
import 'secondpage.dart';
import 'mapa.dart';
import 'thirdpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Eureka',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF01288D),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.lightBlue[200],
      ),
      home:
          const HomePageContent(), // Alterei para HomePageContent para resolver o problema do Scaffold
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

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
              title: const Text('Busca por nome do aluno'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Busca por nome de projeto'),
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
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(200, 200),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.black, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'Nome do Aluno',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(200, 200),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.assignment, color: Colors.black, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'Nome do Projeto',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FourthPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(200, 200),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outline, color: Colors.black, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'Nome do Orientador',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  // Novo botão de MAPA
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(200, 200),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, color: Colors.black, size: 40),
                      SizedBox(height: 10),
                      Text(
                        'Mapa',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
