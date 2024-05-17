import 'package:flutter/material.dart';

class BoothWidget extends StatelessWidget {
  late final (int, int) superiorLeftPoint;
  late final (int, int) inferiorRightPoint;
  late final (int, int) entryBoothPoint;
  late Color color;
  late Function((int, int)) callbackFunction;
  BoothWidget({
    super.key,
    required this.superiorLeftPoint,
    required this.inferiorRightPoint,
    required this.color,
  }) {
    entryBoothPoint = (inferiorRightPoint.$1 + 1, inferiorRightPoint.$2 - 2);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        callbackFunction(entryBoothPoint);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        overlayColor: MaterialStateProperty.all<Color>(color),
        shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
      ),
      child: const Text(""),
    );
  }
}
