import 'package:flutter/material.dart';
import 'package:projeto_integrador/PathFinding/AllBoothsMap.dart';
import 'package:projeto_integrador/Widget/map-widget.dart';

import 'secondpage.dart';
import 'main.dart';
import 'thirdpage.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2E93),
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
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome de projeto'),
              onTap: () {
                Navigator.pushReplacement(
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
          child: MapWidget(
              boothsList: AllBoothsMap.GetAllBoothsList(),
              matrixSize: (59, 30)),
        ),
      ),
    );
  }
}
