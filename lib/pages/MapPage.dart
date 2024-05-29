import 'package:flutter/material.dart';
import 'package:projeto_integrador/Widget/map-widget.dart';
import 'package:projeto_integrador/pages/AdvisorSearchPage.dart';
import 'StudentSearchPage.dart';
import 'SearchOptionsPage.dart';
import 'ProjectSearchPage.dart';

class MapPage extends StatefulWidget {
  final Offset simulatedTapPosition;
  (int, int)? startPoint;
  (int, int)? endPoint;

  MapPage(
      {super.key,
      this.simulatedTapPosition = Offset.zero,
      this.startPoint,
      this.endPoint});

  @override
  MapPageState createState() => MapPageState(startPoint, endPoint);
}

class MapPageState extends State<MapPage> {
  (int, int)? startPoint;
  (int, int)? endPoint;
  late MapWidget mapWidget;

  @override
  void initState() {
    super.initState();
  }

  MapPageState(this.startPoint, this.endPoint) {
    mapWidget = MapWidget.Eureka2023();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2E93),
        title: Row(
          children: [
            IconButton(
              onPressed: () async {
                ((int, int), (int, int))? coordinatesTuple =
                    await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchOptionsPage()),
                );

                setState(() {
                  if (coordinatesTuple == null) return;
                  startPoint = coordinatesTuple.$1;
                  endPoint = coordinatesTuple.$2;
                  mapWidget.CalculatePathAndRender(startPoint!, endPoint!);
                });
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
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
                  MaterialPageRoute(
                      builder: (context) => const SearchOptionsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome do aluno'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentSearchPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome de projeto'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProjectSearchPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Pesquisa por nome de Orientador'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdvisorSearchPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(child: mapWidget),
      ),
    );
  }
}
