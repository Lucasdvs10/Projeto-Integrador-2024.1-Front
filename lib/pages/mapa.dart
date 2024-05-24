import 'package:flutter/material.dart';
import 'package:projeto_integrador/PathFinding/AllBoothsMap.dart';
import 'package:projeto_integrador/Widget/map-widget.dart';
import 'package:projeto_integrador/pages/fourthpage.dart';
import 'secondpage.dart';
import 'main.dart';
import 'thirdpage.dart';

class MapPage extends StatefulWidget {
  final Offset simulatedTapPosition;

  const MapPage({super.key, this.simulatedTapPosition = Offset.zero});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.simulatedTapPosition != Offset.zero) {
        // Simular o toque na posição especificada
        _simulateTap(widget.simulatedTapPosition);
      }
    });
  }

  void _simulateTap(Offset position) {
    // Lógica para simular o toque na posição especificada
    print('Simulated tap at position: $position');
    // Aqui você pode adicionar a lógica necessária para o MapWidget simular o toque.
    // Por exemplo, chamando um método dentro do MapWidget que aceita uma posição e executa uma ação.
  }

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
            ListTile(
              title: const Text('Pesquisa por nome de Orientador'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FourthPage()),
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
            matrixSize: (59, 30),
          ),
        ),
      ),
    );
  }
}
