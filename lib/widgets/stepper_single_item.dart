import 'package:asadullah_tyrads_test/widgets/step_count_widget.dart';
import 'package:flutter/material.dart';

class StepperSingleItemWidget extends StatelessWidget {
  const StepperSingleItemWidget(
      {Key? key,
      required this.isActive,
      required this.stepNumber,
      required this.isDone,
      required this.showVerticalLine,
      required this.title,
      this.subtitle,
      required this.description,
      required this.positiveButtonTitle,
      required this.positiveButtonAction,
      required this.isPositiveButtonEnabled,
      required this.negativeButtonTitle,
      required this.negativeButtonAction,
      required this.isNegativeButtonEnabled})
      : super(key: key);

  final bool isActive;

  final int stepNumber;
  final bool isDone;

  final bool showVerticalLine;
  final String title;
  final String? subtitle;
  final String description;

  final String positiveButtonTitle;
  final Function() positiveButtonAction;
  final bool isPositiveButtonEnabled;

  final String negativeButtonTitle;
  final Function() negativeButtonAction;
  final bool isNegativeButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StepCountWidget(
                width: 30.0,
                stepNumber: stepNumber,
                isEnabled: isActive,
                isDone: isDone),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.black : Colors.grey),
                  ),
                  if (subtitle != null && subtitle != 'null')
                    Column(
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 14),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      width: 2,
                      height: isActive ? double.infinity : 40,
                      margin: const EdgeInsets.symmetric(horizontal: 14.0),
                      color:
                          showVerticalLine ? Colors.grey : Colors.transparent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              if (isActive)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(description,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black)),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                  onPressed: isPositiveButtonEnabled
                                      ? positiveButtonAction
                                      : null,
                                  child: Text(
                                    positiveButtonTitle.toUpperCase(),
                                    style: TextStyle(
                                      color: isPositiveButtonEnabled
                                          ? Colors.white
                                          : Colors.blueGrey,
                                    ),
                                  )),
                              const SizedBox(
                                width: 12,
                              ),
                              TextButton(
                                  onPressed: isNegativeButtonEnabled
                                      ? negativeButtonAction
                                      : null,
                                  child: Text(
                                    negativeButtonTitle.toUpperCase(),
                                    style: TextStyle(
                                      color: isNegativeButtonEnabled
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        )
      ],
    );
  }
}
