import 'package:flutter/material.dart';

class BoothWidget extends StatelessWidget {
  late final (int, int) superiorLeftPoint;
  late final (int, int) inferiorRightPoint;
  late final (int, int) entryBoothPoint;
  late final Color color;
  late final Function() onPressed;
  BoothWidget(
      {super.key,
      required this.superiorLeftPoint,
      required this.inferiorRightPoint,
      required this.entryBoothPoint,
      required this.color,
      required this.onPressed}) {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        overlayColor: MaterialStateProperty.all<Color>(color),
        shape: const MaterialStatePropertyAll(BeveledRectangleBorder()),
      ),
      child: const Text(""),
    );
  }
}
