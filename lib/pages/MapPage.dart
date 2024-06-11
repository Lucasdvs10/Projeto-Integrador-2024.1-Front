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
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor da seta de voltar como branca
        ),
        leading: IconButton(
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
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: const Text(
              'EUREKA',
              style: TextStyle(
                fontFamily: 'Dongle',
                fontSize: 36,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(child: mapWidget),
      ),
    );
  }
}
