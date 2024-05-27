import 'package:flutter/material.dart';

class BoothWidget extends StatelessWidget {
  late final (int, int) superiorLeftPoint;
  late final (int, int) entryBoothPoint;
  late final (int, int) sizes;
  late Color color;
  late Function((int, int), (int, int)) callbackFunction;
  int? boothNumber;
  BoothWidget({
    super.key,
    required this.superiorLeftPoint,
    required this.sizes,
    required this.color,
    (int, int)? entryBoothPoint,
    this.boothNumber
  }) {
    if (entryBoothPoint == null) {
      this.entryBoothPoint =
          (superiorLeftPoint.$1, superiorLeftPoint.$2 + sizes.$2);
    } else {
      this.entryBoothPoint = entryBoothPoint;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        callbackFunction((58, 7), entryBoothPoint);
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
