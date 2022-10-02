import 'package:flutter/material.dart';

class StepCountWidget extends StatelessWidget {
  const StepCountWidget(
      {Key? key,
      required this.width,
      required this.stepNumber,
      required this.isEnabled,
      required this.isDone})
      : super(key: key);

  final double width;
  final int stepNumber;
  final bool isEnabled;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
          color: isEnabled || isDone ? Colors.blue : Colors.grey,
          shape: BoxShape.circle),
      child: Center(
          child: isDone
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Text(stepNumber.toString(),
                  style: const TextStyle(fontSize: 18.0, color: Colors.white))),
    );
  }
}
