import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importe o pacote url_launcher
import 'AdvisorSearchPage.dart';
import 'StudentSearchPage.dart';
import 'MapPage.dart';
import 'ProjectSearchPage.dart';



class SearchOptionsPage extends StatelessWidget {
  const SearchOptionsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2E93),
        centerTitle: true,
        title: Text(
          'EUREKA',
          style: TextStyle(
            fontFamily: 'Dongle',
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/eureka4.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
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
                            builder: (context) => const StudentSearchPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(200, 200),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            'Nome do Aluno',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProjectSearchPage(),
                          ),
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
                          Icon(Icons.assignment, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            'Nome do Projeto',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AdvisorSearchPage(),
                          ),
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
                          Icon(Icons.person_outline, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            'Nome do Orientador',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Tooltip(
              message: 'Saiba mais sobre o Eureka!',
              child: GestureDetector(
                onTap: () {
                  const url = 'https://eureka.maua.br/';
                  launch(url); // Abre o link no navegador
                },
                child: Container(
                  width: 65, // Tamanho do círculo aumentado
                  height: 65, // Tamanho do círculo aumentado
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'i',
                      style: TextStyle(
                        fontSize: 48, // Tamanho do ícone aumentado
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
